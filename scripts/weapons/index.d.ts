import { Entity, ItemStack, Player } from "@minecraft/server";

import { DropletsPattern } from "../droplets/droplets.js";

import "./shooter.js";

export const weaponsDataBase: {
    shotDelay: number;
    useInk: number;
    eventName: string;
    weaponType: string;
    dropletsPattern: DropletsPattern;
};

export const playerUsingItemMap: Map<Player, ItemStack>;

export const projectileOwnerDataBase: Map<Entity, number>;
