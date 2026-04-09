import type { ToolRegistry } from './tool-registry.js';
import { Subagent } from '../core/subagent.js';

import type { BridgeClient } from '../client.js';

export function registerSubagentTools(registry: ToolRegistry, projectRoot: string, client: BridgeClient) {
    registry.register({
        name: 'agent',
        description: 'Spawn a specialized agent to perform tasks asynchronously without polluting current context. Launch a new agent to handle complex, multi-step tasks autonomously. Use subagent_type to specify the type.',
        parameters: {
            type: 'object',
            properties: {
                name: { type: 'string', description: 'Brief name for this agent instance (e.g. ship-audit)' },
                subagent_type: { 
                    type: 'string', 
                    description: 'code-reviewer, implementer, or general. Omit to launch a general fork.',
                    enum: ['code-reviewer', 'implementer', 'general']
                },
                prompt: { type: 'string', description: 'Clear directive prompt with full context and instructions.' }
            },
            required: ['name', 'prompt']
        },
        handler: async (args: any) => {
            const subagent = new Subagent(registry, projectRoot, client);
            // activeScene can be passed implicitly if tracked, for now pass empty or track globally
            return await subagent.run(args.prompt, args.subagent_type || 'general', args.name);
        }
    });
}
