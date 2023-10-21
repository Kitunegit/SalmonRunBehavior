import { Entity, ScoreboardIdentity, world } from '@minecraft/server';

export function Get(objective: string, target: Entity | ScoreboardIdentity | string): number | null;

export function Set(objective: string, target: Entity | ScoreboardIdentity | string, value: number): void

export function Add(objective: string, target: Entity | ScoreboardIdentity | string, value: number): void;
