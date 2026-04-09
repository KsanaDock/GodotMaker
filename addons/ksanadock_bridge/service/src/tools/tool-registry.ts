export interface ToolDefinition {
    name: string;
    description: string;
    parameters: {
        type: 'object';
        properties: Record<string, any>;
        required: string[];
    };
    handler: (args: any) => Promise<any>;
}

export class ToolRegistry {
    private tools: Map<string, ToolDefinition> = new Map();

    register(tool: ToolDefinition) {
        this.tools.set(tool.name, tool);
        console.log(`Registered tool: ${tool.name}`);
    }

    getToolDefinitions() {
        return Array.from(this.tools.values()).map(tool => ({
            type: 'function',
            function: {
                name: tool.name,
                description: tool.description,
                parameters: tool.parameters
            }
        }));
    }

    async execute(name: string, args: any): Promise<any> {
        const tool = this.tools.get(name);
        if (!tool) {
            throw new Error(`Tool not found: ${name}`);
        }
        return await tool.handler(args);
    }
}
