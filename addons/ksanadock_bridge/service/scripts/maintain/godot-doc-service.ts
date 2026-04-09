import * as fs from 'fs';
import * as path from 'path';
import { XMLParser } from 'fast-xml-parser';
import { CLASS_UNIFIED } from './godot-class-list.js';

export interface ConversionConfig {
    classDescription: 'none' | 'first' | 'brief' | 'full';
    methodDescriptions: 'none' | 'first' | 'full';
    propertyDescriptions: 'none' | 'first' | 'full';
    signalDescriptions: 'none' | 'first' | 'full';
    constantDescriptions: 'none' | 'first' | 'full';
    maxEnumValues: number;
    noVirtual: boolean;
    compactFormat: boolean;
    simpleSignals: boolean;
}

export const DEFAULT_CONFIG: ConversionConfig = {
    classDescription: 'brief',
    methodDescriptions: 'none',
    propertyDescriptions: 'none',
    signalDescriptions: 'none',
    constantDescriptions: 'none',
    maxEnumValues: 10,
    noVirtual: true,
    compactFormat: true,
    simpleSignals: true,
};

export class GodotDocService {
    private parser: XMLParser;

    constructor() {
        this.parser = new XMLParser({
            ignoreAttributes: false,
            attributeNamePrefix: '',
            textNodeName: '_text',
            processEntities: { maxTotalExpansions: 100000 },
            transformTagName: (tagName) => tagName === 'constructor' ? 'constructor_tag' : tagName
        });
    }

    private convertBbcode(text: string): string {
        if (!text) return '';

        let result = text;
        result = result.replace(/\[code\](.*?)\[\/code\]/g, '`$1`');
        result = result.replace(/\[b\](.*?)\[\/b\]/g, '**$1**');
        result = result.replace(/\[i\](.*?)\[\/i\]/g, '*$1*');
        result = result.replace(/\[(method|member|signal|param|constant|enum)\s+([^\]]+)\]/g, '`$2`');
        result = result.replace(/\[([A-Z][a-zA-Z0-9_]+)\]/g, '$1');
        result = result.replace(/\[url[^\]]*\].*?\[\/url\]/g, '');
        result = result.replace(/\[codeblock\][\s\S]*?\[\/codeblock\]/g, '');
        result = result.replace(/\[codeblocks\][\s\S]*?\[\/codeblocks\]/g, '');
        
        return result.replace(/\s+/g, ' ').trim();
    }

    private firstSentence(text: string): string {
        const converted = this.convertBbcode(text);
        if (!converted) return '';
        const match = converted.match(/^[^.!?]*[.!?]/);
        return match ? match[0].trim() : converted.substring(0, 100).trim();
    }

    private getDescription(text: string | undefined, mode: string): string {
        if (!text || mode === 'none') return '';
        if (mode === 'first') return this.firstSentence(text);
        return this.convertBbcode(text);
    }

    public parseClass(xmlContent: string, config: ConversionConfig = DEFAULT_CONFIG): string | null {
        const jsonObj = this.parser.parse(xmlContent);
        const root = jsonObj.class;
        if (!root) return null;

        const name = root.name;
        const inherits = root.inherits || '';
        
        const lines: string[] = [];
        if (config.compactFormat && inherits) {
            lines.push(`## ${name} <- ${inherits}`);
        } else {
            lines.push(`## ${name}`);
            if (inherits) lines.push(`Inherits: ${inherits}`);
        }
        lines.push('');

        // Brief Description
        const briefDesc = root.brief_description?._text || '';
        if (config.classDescription !== 'none' && briefDesc) {
            lines.push(this.getDescription(briefDesc, config.classDescription));
            lines.push('');
        }

        // Properties
        const members = Array.isArray(root.members?.member) ? root.members.member : (root.members?.member ? [root.members.member] : []);
        if (members.length > 0) {
            lines.push(config.compactFormat ? '**Props:**' : '### Properties');
            if (!config.compactFormat) lines.push('| Name | Type | Default |\n|------|------|---------|');
            
            for (const m of members) {
                const mname = m.name;
                const mtype = m.enum ? `${m.type} (${m.enum})` : m.type;
                const mdefault = m.default || '';
                
                if (config.compactFormat) {
                    lines.push(`- ${mname}: ${mtype}${mdefault ? ` = ${mdefault}` : ''}`);
                } else {
                    lines.push(`| ${mname} | ${mtype} | ${mdefault} |`);
                }
            }
            lines.push('');
        }

        // Constructors
        const constructors = Array.isArray(root.constructors?.constructor_tag) ? root.constructors.constructor_tag : (root.constructors?.constructor_tag ? [root.constructors.constructor_tag] : []);
        if (constructors.length > 0) {
            lines.push(config.compactFormat ? '**Ctors:**' : '### Constructors');
            for (const c of constructors) {
                const params = Array.isArray(c.param) ? c.param : (c.param ? [c.param] : []);
                const paramStr = params.map((p: any) => `${p.name}: ${p.type}${p.default ? ` = ${p.default}` : ''}`).join(', ');
                lines.push(`- ${c.name}(${paramStr})`);
            }
            lines.push('');
        }

        // Methods
        const methods = Array.isArray(root.methods?.method) ? root.methods.method : (root.methods?.method ? [root.methods.method] : []);
        const filteredMethods = config.noVirtual ? methods.filter((m: any) => !m.qualifiers?.includes('virtual')) : methods;
        
        if (filteredMethods.length > 0) {
            lines.push(config.compactFormat ? '**Methods:**' : '### Methods');
            for (const m of filteredMethods) {
                const mname = m.name;
                const retType = m.return?.type || 'void';
                const params = Array.isArray(m.param) ? m.param : (m.param ? [m.param] : []);
                const paramStr = params.map((p: any) => `${p.name}: ${p.type}${p.default ? ` = ${p.default}` : ''}`).join(', ');
                
                const retStr = retType !== 'void' ? ` -> ${retType}` : '';
                lines.push(`- ${mname}(${paramStr})${retStr}`);
            }
            lines.push('');
        }

        // Operators
        const operators = Array.isArray(root.operators?.operator) ? root.operators.operator : (root.operators?.operator ? [root.operators.operator] : []);
        if (operators.length > 0) {
            lines.push(config.compactFormat ? '**Operators:**' : '### Operators');
            for (const o of operators) {
                const oname = o.name;
                const retType = o.return?.type || 'void';
                const params = Array.isArray(o.param) ? o.param : (o.param ? [o.param] : []);
                const paramStr = params.map((p: any) => `${p.name}: ${p.type}`).join(', ');
                const retStr = retType !== 'void' ? ` -> ${retType}` : '';
                lines.push(`- ${oname}(${paramStr})${retStr}`);
            }
            lines.push('');
        }

        // Signals
        const signals = Array.isArray(root.signals?.signal) ? root.signals.signal : (root.signals?.signal ? [root.signals.signal] : []);
        if (signals.length > 0) {
            lines.push(config.compactFormat ? '**Signals:**' : '### Signals');
            for (const s of signals) {
                const sname = s.name;
                const params = Array.isArray(s.param) ? s.param : (s.param ? [s.param] : []);
                const paramStr = params.length > 0 ? `(${params.map((p: any) => `${p.name}: ${p.type}`).join(', ')})` : (config.simpleSignals ? '' : '()');
                lines.push(`- ${sname}${paramStr}`);
            }
            lines.push('');
        }

        return lines.join('\n');
    }

    public async convertDirectorySplit(inputDir: string, outputDir: string, config: ConversionConfig = DEFAULT_CONFIG): Promise<void> {
        if (!fs.existsSync(outputDir)) fs.mkdirSync(outputDir, { recursive: true });

        const files = fs.readdirSync(inputDir).filter(f => f.endsWith('.xml'));
        const unifiedSet = new Set(CLASS_UNIFIED);
        
        const commonEntries: string[] = [];
        const otherEntries: string[] = [];

        console.log(`[GodotDocService] Converting ${files.length} XML files...`);

        for (const file of files) {
            const filePath = path.join(inputDir, file);
            const content = fs.readFileSync(filePath, 'utf-8');
            
            const jsonObj = this.parser.parse(content);
            const root = jsonObj.class;
            if (!root || !root.name) continue;

            const name = root.name;
            const inherits = root.inherits || '';
            const briefStr = root.brief_description?._text || '';
            const brief = briefStr ? this.firstSentence(briefStr) : '';

            // Generate per-class MD
            const result = this.parseClass(content, { ...config, classDescription: 'full' });
            if (result) {
                fs.writeFileSync(path.join(outputDir, `${name}.md`), result);
                
                const entry = `- ${name}${inherits ? ` <- ${inherits}` : ''}${brief ? ` — ${brief}` : ''}`;
                if (unifiedSet.has(name)) {
                    commonEntries.push(entry);
                } else {
                    otherEntries.push(entry);
                }
            }
        }

        // Write indices
        fs.writeFileSync(path.join(outputDir, '_common.md'), `# Common Classes\n\n${commonEntries.sort().join('\n')}\n`);
        fs.writeFileSync(path.join(outputDir, '_other.md'), `# Other Classes\n\n${otherEntries.sort().join('\n')}\n`);
        
        console.log(`[GodotDocService] Conversion complete. Common: ${commonEntries.length}, Other: ${otherEntries.length}`);
    }
}
