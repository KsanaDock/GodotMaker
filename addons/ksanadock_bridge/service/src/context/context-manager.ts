export interface Message {
    role: 'system' | 'user' | 'assistant' | 'tool';
    content: string;
    name?: string;
    tool_call_id?: string;
}

export class ContextManager {
    private history: Message[] = [];
    private maxTokens: number = 100000; // Default budget (approx chars / 4)
    private systemPrompt: Message | null = null;

    constructor(maxTokens?: number) {
        if (maxTokens) this.maxTokens = maxTokens;
    }

    setSystemPrompt(content: string) {
        this.systemPrompt = { role: 'system', content };
    }

    addMessage(message: Message) {
        this.history.push(message);
        this.pruneHistory();
    }

    getHistory(): Message[] {
        const result: Message[] = [];
        if (this.systemPrompt) result.push(this.systemPrompt);
        result.push(...this.history);
        return result;
    }

    private pruneHistory() {
        // Simple token estimation: 1 token ≈ 4 characters
        let currentTokens = this.calculateTokens(this.history);
        const systemTokens = this.systemPrompt ? this.calculateTokens([this.systemPrompt]) : 0;
        
        while (currentTokens + systemTokens > this.maxTokens && this.history.length > 0) {
            // Never prune the last user message or the last tool call in a sequence
            // But if we're desperate, we remove the oldest pairs.
            // Ideally should keep pairs of (user, assistant, tool_results)
            this.history.shift();
            currentTokens = this.calculateTokens(this.history);
        }
    }

    private calculateTokens(messages: Message[]): number {
        return messages.reduce((acc, msg) => acc + ((msg.content || '').length / 4), 0);
    }
}
