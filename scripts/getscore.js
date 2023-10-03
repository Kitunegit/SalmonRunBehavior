import { world } from '@minecraft/server';

/**
 * @param {import('@minecraft/server').Player|import('@minecraft/server').Entity|string} target
 * @param {string} objective
 * @returns {number|null}
 */
export function Get(objective, target) {
    try {
        return world.scoreboard.getObjective(objective).getScore(target) ?? 0;
    } catch (e) {
        console.error(e, e.stack);
        return null;
    }
}
export function Set(objective,target,number) {
    try {
        world.scoreboard.getObjective(objective).setScore(target,number);
    }
    catch(e){ return true;}
}