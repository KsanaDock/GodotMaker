import type { ToolDefinition } from './tool-registry.js';
import { TaskManager } from '../core/task_manager.js';

let taskManagerInstance: TaskManager | null = null;
function getTasks(projectRoot: string) {
    if (!taskManagerInstance) taskManagerInstance = new TaskManager(projectRoot);
    return taskManagerInstance;
}

export function registerPlanningTools(registry: any, projectRoot: string) {
    registry.register({
        name: 'task_create',
        description: 'Create a new persistent task in the DAG. Use this to break down complex goals into tracking steps.',
        parameters: {
            type: 'object',
            properties: {
                subject: { type: 'string', description: 'Brief title of the task (e.g., "Build Character Controller").' },
                description: { type: 'string', description: 'Detailed intention or scripts to modify.' }
            },
            required: ['subject']
        },
        handler: async (args: any) => {
            return getTasks(projectRoot).create(args.subject, args.description || '');
        }
    });

    registry.register({
        name: 'task_update',
        description: 'Update the status or dependencies of an existing task. Setting status "completed" will automatically unblock dependent tasks.',
        parameters: {
            type: 'object',
            properties: {
                task_id: { type: 'number', description: 'The ID of the task to update.' },
                status: { type: 'string', enum: ['pending', 'in_progress', 'completed', 'failed'], description: 'The new status.' },
                add_blocked_by: { type: 'array', items: { type: 'number' }, description: 'Task IDs that must complete before this one.' },
                remove_blocked_by: { type: 'array', items: { type: 'number' }, description: 'Task IDs to unbind from.' }
            },
            required: ['task_id']
        },
        handler: async (args: any) => {
            return getTasks(projectRoot).update(args.task_id, args.status, args.add_blocked_by, args.remove_blocked_by);
        }
    });

    registry.register({
        name: 'task_list',
        description: 'List all persistent tasks in the DAG and their current states.',
        parameters: { type: 'object', properties: {}, required: [] },
        handler: async () => {
            return getTasks(projectRoot).listAll();
        }
    });

    registry.register({
        name: 'task_get',
        description: 'Get details of a specific task.',
        parameters: {
            type: 'object',
            properties: { task_id: { type: 'number' } },
            required: ['task_id']
        },
        handler: async (args: any) => {
            return getTasks(projectRoot).get(args.task_id);
        }
    });
}
