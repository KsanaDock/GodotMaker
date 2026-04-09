import * as path from 'path';
import * as fs from 'fs';
import { execSync } from 'child_process';
import { pathToFileURL, fileURLToPath } from 'url';
import { BridgeClient } from '../client.js';
import { ToolRegistry } from '../tools/tool-registry.js';
import { parseMarkdownSkill, type MarkdownSkill } from './markdown-loader.js';
import { Subagent } from '../core/subagent.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export class SkillManager {
    private projectRoot: string;
    private registry: ToolRegistry;
    private client: BridgeClient;

    constructor(projectRoot: string, registry: ToolRegistry, client: BridgeClient) {
        this.projectRoot = projectRoot;
        this.registry = registry;
        this.client = client;
    }

    async loadProjectSkills() {
        // 1. Load Hardcoded JS/TS Skills from built-in src/skills directory
        const builtInTsDir = __dirname;
        await this.loadTsSkills(builtInTsDir);

        // 2. Load System Markdown Skills from service/skills/system
        // service root is 2 levels up from src/skills/skill-manager.ts
        const serviceRoot = path.join(__dirname, '..', '..');
        const systemMarkdownDir = path.join(serviceRoot, 'skills', 'system');
        
        await this.loadMarkdownSkills(systemMarkdownDir, 'system');

        // 3. Load User Markdown Skills from [ProjectRoot]/.ksanadock/skills
        const userMarkdownDir = path.join(this.projectRoot, '.ksanadock', 'skills');
        await this.loadMarkdownSkills(userMarkdownDir, 'user');
    }

    private async loadTsSkills(dir: string) {
        if (!fs.existsSync(dir)) return;

        const files = fs.readdirSync(dir).filter((f: string) => 
            (f.endsWith('.ts') || f.endsWith('.js')) && 
            f !== 'skill-manager.ts' && 
            f !== 'markdown-loader.ts'
        );
        
        for (const file of files) {
            try {
                const filePath = path.join(dir, file);
                const fileUrl = pathToFileURL(filePath).href;
                const skillModule = await import(fileUrl);
                
                if (typeof skillModule.register === 'function') {
                    skillModule.register(this.registry, this.client);
                    console.log(`[SKILLS] Registered TS skill: ${file}`);
                }
            } catch (err: any) {
                console.error(`[SKILLS] Failed to load TS skill ${file}:`, err.message);
            }
        }
    }

    private async loadMarkdownSkills(baseDir: string, type: 'system' | 'user') {
        if (!fs.existsSync(baseDir)) {
            if (type === 'system') console.warn(`[SKILLS] System skills directory not found: ${baseDir}`);
            return;
        }

        const entries = fs.readdirSync(baseDir, { withFileTypes: true });
        
        for (const entry of entries) {
            if (entry.isDirectory()) {
                const skillDir = path.join(baseDir, entry.name);
                const skillFilePath = path.join(skillDir, 'SKILL.md');
                if (fs.existsSync(skillFilePath)) {
                    const skill = parseMarkdownSkill(skillFilePath);
                    if (skill) {
                        this.registerMarkdownSkill(skill, type, skillDir);
                    }
                }
            }
        }
    }

    private registerMarkdownSkill(skill: MarkdownSkill, type: string, skillDir: string) {
        const { metadata, content } = skill;
        
        this.registry.register({
            name: metadata.name,
            description: `[${type.toUpperCase()}_SKILL] ${metadata.description}`,
            parameters: {
                type: 'object',
                properties: {
                    argument: { 
                        type: 'string', 
                        description: metadata.argument_hint || 'The goal or task description for this skill.' 
                    }
                },
                required: ['argument']
            },
            handler: async (args: any) => {
                const subagent = new Subagent(this.registry, this.projectRoot, this.client);
                
                // Inject the skill content as the base system prompt
                // Prepend base directory so the agent can read sub-files mentions (like in godogen)
                const processedContent = content.replace(/\$\{SKILL_DIR\}/g, skillDir);
                const enhancedPrompt = `## Skill: ${metadata.name}\n${processedContent}\n\n## User Task:\n${args.argument}`;
                
                return await subagent.run(enhancedPrompt, metadata.name, metadata.name);
            }
        });
        
        console.log(`[SKILLS] Registered Markdown skill: ${metadata.name} (${type})`);
    }
}
