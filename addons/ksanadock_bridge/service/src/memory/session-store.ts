import * as fs from 'fs/promises';
import * as path from 'path';

export class SessionStore {
    private sessionPath: string;

    constructor(projectRoot: string) {
        this.sessionPath = path.join(projectRoot, '.ksanadock', 'sessions');
    }

    async saveSession(sessionId: string, history: any[]) {
        try {
            await fs.mkdir(this.sessionPath, { recursive: true });
            const filePath = path.join(this.sessionPath, `${sessionId}.json`);
            await fs.writeFile(filePath, JSON.stringify({
                sessionId,
                updatedAt: new Date().toISOString(),
                history
            }, null, 2));
        } catch (e) {
            console.error('Failed to save session:', e);
        }
    }

    async loadSession(sessionId: string): Promise<any[] | null> {
        try {
            const filePath = path.join(this.sessionPath, `${sessionId}.json`);
            const content = await fs.readFile(filePath, 'utf-8');
            const data = JSON.parse(content);
            return data.history;
        } catch (e) {
            return null;
        }
    }
}
