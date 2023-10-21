import { world, system, Vector } from "@minecraft/server";

import * as Score from "../getscore.js";

import { dropletsDataBase, DropletsPattern } from "../splatTest/droplets.js";

const weaponsDataBase = {
    "spl:splatter_shot": {
        shotDelay: 2,
        useInk: 92,
        eventName:"spl:splatter_shot",
        weaponType:"Shooter",
        dropletsPattern: new DropletsPattern([3, 9, 6])
    }
};

const playerUsingItemMap = new Map();

//右クリ開始
world.afterEvents.itemStartUse.subscribe(({ source, itemStack }) => {
    dropletsDataBase.set(source, weaponsDataBase[itemStack.typeId].dropletsPattern);
    playerUsingItemMap.set(source, itemStack);
});

//右クリ終了
world.afterEvents.itemStopUse.subscribe(({ source }) => {
    playerUsingItemMap.delete(source);
});

export const projectileOwnerDataBase = new Map();

system.runInterval(() => {
    world.getAllPlayers().forEach(player => {
        //情報取得
        const itemStack = playerUsingItemMap.get(player);
        if (!itemStack) return;
        const weaponData = weaponsDataBase[itemStack.typeId];

        if (Score.Get(`ink`, player) > weaponData.useInk && Score.Get(`shot_cool`, player) <= 0) {
            const projectile = player.dimension.spawnEntity("spl:splatter_shot_ink", Vector.add(player.getHeadLocation(), player.getViewDirection()));
            projectile.addTag("ink");
            projectileOwnerDataBase.set(projectile, player.id);
            projectile.triggerEvent("spl:splatter_shot");
            projectile.applyImpulse(Vector.multiply(player.getViewDirection(), 3));

            Score.Set(`shot_cool`,player,weaponData.shotDelay);
            player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.6 });
            player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.8 });

            const droplets = dropletsDataBase.get(player).rand(player.location, 1);
            const runId = system.runInterval(() => {
                if (!world.getEntity(projectile.id)) {
                    system.clearRun(runId);
                    return;
                }
                const entity = droplets.fly(projectile);
                if (entity) entity.addTag("droplets");
            });
        }
    });
    world.getDimension("overworld").getEntities({ tags: ["droplets"] }).forEach(entity => {
        try {
            if (!world.getEntity(entity.id)) return;
            //entity.addEffect("invisibility", 10000000);
            entity.dimension.spawnParticle("spl:moves", entity.location);
            if (entity.isOnGround) entity.kill();
        }
        catch (e) {}
    });
});
