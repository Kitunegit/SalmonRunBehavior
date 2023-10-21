import { world } from '@minecraft/server';

/**
 * @param {string} objective
 * @param {import('@minecraft/server').Entity | import("@minecraft/server").ScoreboardIdentity | string} target
 * @returns {number | null}
 */
export function Get(objective, target) {
    try {
        return world.scoreboard.getObjective(objective).getScore(target) ?? 0;
    }
    catch (e) { return null; }
}

/**
 * @param {string} objective 
 * @param {import("@minecraft/server").Entity | import("@minecraft/server").ScoreboardIdentity | string} target 
 * @param {number} value
 */
export function Set(objective, target, value) {
    try {
        world.scoreboard.getObjective(objective).setScore(target, value);
    }
    catch (e) {}
}
