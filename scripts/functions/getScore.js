import { world } from '@minecraft/server';

export function Get(objective, target) {
    try {
        return world.scoreboard.getObjective(objective).getScore(target) ?? 0;
    }
    catch (e) { return null; }
}

export function Set(objective, target, value) {
    try {
        world.scoreboard.getObjective(objective).setScore(target, value);
    }
    catch (e) {}
}

export function Add(objective, target, value) {
    try {
        world.scoreboard.getObjective(objective).addScore(target, value);
    }
    catch (e) {}
}
