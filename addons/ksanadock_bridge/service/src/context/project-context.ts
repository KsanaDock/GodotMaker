import * as fs from 'fs/promises';
import * as path from 'path';

/**
 * Loads and merges AGENTS.md files from the project root down to the target file's directory.
 * This implements the hierarchical context pattern (inspired by Codex AGENTS.md).
 */
export async function getHierarchicalContext(projectRoot: string, activeScenePath: string): Promise<string> {
    // 1. Map res:// path to absolute path
    let targetDir = projectRoot;
    if (activeScenePath.startsWith('res://')) {
        const relative = activeScenePath.replace('res://', '');
        targetDir = path.join(projectRoot, path.dirname(relative));
    }

    const contextFiles: string[] = [];
    let current = targetDir;

    // 2. Traverse upwards from targetDir to projectRoot to collect AGENTS.md files
    while (true) {
        const possibleFiles = [
            path.join(current, 'AGENTS.md'),
            path.join(current, '.ksanadock', 'agents.md'),
            path.join(current, '.ksana', 'agents.md')
        ];

        for (const file of possibleFiles) {
            try {
                const content = await fs.readFile(file, 'utf-8');
                contextFiles.push(`--- Context from ${path.relative(projectRoot, file)} ---\n${content}`);
                break; // Found one at this level, don't look for others in the same level
            } catch (e) {
                // Not found, continue
            }
        }

        if (current === projectRoot || current === path.dirname(current)) break;
        current = path.dirname(current);
    }

    // 3. Since we traversed upwards, the root-most files are at the end. 
    // We want to merge them such that folder-specific instructions have higher priority (or appear later).
    // Actually, usually global defaults come first, then overrides.
    return contextFiles.reverse().join('\n\n');
}
