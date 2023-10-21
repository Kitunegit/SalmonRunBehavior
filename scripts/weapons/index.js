import { Entity, ItemStack, Player, world } from "@minecraft/server";

import { dropletsDataBase, DropletsPattern } from "../droplets/droplets.js";

import "./shooter.js";

export const weaponsDataBase = {
    "spl:splatter_shot": {
        shotDelay: 2,
        useInk: 92,
        eventName:"spl:splatter_shot",
        weaponType:"Shooter",
        dropletsPattern: new DropletsPattern([3, 9, 6])
    }
};

/**
 * @type {Map<Player, ItemStack>}
 */
export const playerUsingItemMap = new Map();

//右クリ開始
world.afterEvents.itemStartUse.subscribe(({ source, itemStack }) => {
    dropletsDataBase.set(source, weaponsDataBase[itemStack.typeId].dropletsPattern);
    playerUsingItemMap.set(source, itemStack);
});

//右クリ終了
world.afterEvents.itemStopUse.subscribe(({ source }) => {
    playerUsingItemMap.delete(source);
});

/**
 * @type {Map<Entity, number>}
 */
export const projectileOwnerDataBase = new Map();
