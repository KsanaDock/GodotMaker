import * as fs from 'fs';
import * as path from 'path';

export interface SkillMetadata {
    name: string;
    description: string;
    whenToUse?: string;
    context?: 'inline' | 'fork';
    [key: string]: any;
}

export interface MarkdownSkill {
    metadata: SkillMetadata;
    content: string;
    path: string;
}

export function parseMarkdownSkill(filePath: string): MarkdownSkill | null {
    try {
        const fullContent = fs.readFileSync(filePath, 'utf-8');
        
        // Simple YAML frontmatter parser
        const frontmatterRegex = /^---([\s\S]*?)---([\s\S]*)$/;
        const match = fullContent.match(frontmatterRegex);
        
        if (!match) {
            console.warn(`[MarkdownLoader] No frontmatter found in ${filePath}`);
            return null;
        }
        
        const frontmatterStr = match[1]!;
        const content = match[2]!.trim();
        
        const metadata: any = {};
        const lines = frontmatterStr.split('\n');
        
        for (const line of lines) {
            const separatorIndex = line.indexOf(':');
            if (separatorIndex !== -1) {
                const key = line.substring(0, separatorIndex).trim();
                const value = line.substring(separatorIndex + 1).trim();
                
                // Handle basic types and YAML-like multi-line strings if needed
                // For now, just handle simple key-value pairs
                if (key && value) {
                    // Remove quotes if present
                    let cleanValue = value.replace(/^["'](.*)["']$/, '$1');
                    metadata[key] = cleanValue;
                }
            }
        }
        
        // Validate required fields
        if (!metadata.name || !metadata.description) {
            console.error(`[MarkdownLoader] Missing required fields 'name' or 'description' in ${filePath}`);
            return null;
        }
        
        return {
            metadata: metadata as SkillMetadata,
            content,
            path: path.dirname(filePath)
        };
    } catch (err: any) {
        console.error(`[MarkdownLoader] Failed to parse ${filePath}:`, err.message);
        return null;
    }
}
