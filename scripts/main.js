import { world, system, BlockPermutation, Vector } from "@minecraft/server";

import * as Score from "./functions/getScore.js";

import "./weapons/index.js";

import { scoreboardObjectiveNames, projectileDamageMap } from "./config.js";

import { projectileOwnerDataBase } from "./weapons/index.js";

for (const objectiveName of scoreboardObjectiveNames) {
    if (world.scoreboard.getObjective(objectiveName)) continue;
    world.scoreboard.addObjective(objectiveName, objectiveName);
}

system.runInterval(() => {
    for (const player of world.getAllPlayers()) {
        if (player.hasTag(`slide_move`)) {
            player.applyKnockback(Math.round(player.getVelocity().x * 100), Math.round(player.getVelocity().z * 100), 1, -0.5);
            player.removeTag(`slide_move`);
        }
        if (player.hasTag(`back_knock`)) {
            player.applyKnockback(Math.round(player.getVelocity().x * 100) * -1, Math.round(player.getVelocity().z * 100) * -1, 3, -0.5);
            player.removeTag(`back_knock`);
        }
        if (Score.Get(`stop`, player) > 1) {
            player.isSneaking = false;
        }
        if (player.hasTag(`lowJump`)) {
            player.applyKnockback(Math.round(player.getVelocity().x * 100),Math.round(player.getVelocity().z * 100),3,0);
            player.removeTag(`lowJump`);
        }
        Score.Set(`x`, player, Math.round(player.getVelocity().x * 100));
        Score.Set(`y`, player, Math.round(player.getVelocity().y * 100));
        Score.Set(`z`, player, Math.round(player.getVelocity().z * 100));
    }
});

/*const itemTagMap = {
    "spl:splatter_shot": "splatter_shooting",
    "spl:splatter_dualies": "splatter_dualies_shot",
    "spl:splatter_charger": "splatter_charger_shot",
    "spl:splatter_spiner": "splatter_spiner_shot",
    "spl:splatter_roller": "splatter_roller_shot",
    "spl:brush": "brush_shot"
};

world.afterEvents.itemStartUse.subscribe(ev => {
    const { itemStack, source } = ev;
    const itemId = itemStack.typeId;

    const tag = itemTagMap[itemId];

    if (tag) {
        source.addTag(tag);
    }

    if (itemId == `spl:splatter_charger`) {
        for (const player of world.getPlayers({ excludeTags: ["sneaking"] })) {
            if (Score.Get(`ink`, player) < 1800) {
                player.sendMessage(`§l§cインク不足!`);
            }
        }
    }
});

world.afterEvents.itemStopUse.subscribe(ev => {
    const { itemStack, source } = ev;
    const itemId = itemStack.typeId;

    const tag = itemTagMap[itemId];
    
    if (tag) {
        source.removeTag(tag);
    }
    
    if (itemId == `spl:splatter_charger`) {
        Score.Set(`spl_chrgr_count`, source, 0);
    }
});
*/

world.afterEvents.entityHurt.subscribe(({ hurtEntity, damage }) => {
    if (/*hurtEntity.typeId === "spl:dummy" && */damage > 1) {
        const scoreDamage = Score.Get("damage", hurtEntity);
        const damageDisplay = hurtEntity.dimension.spawnEntity("spl:damage", Vector.add(hurtEntity.location, { x: 0, y: 0.2, z: Math.random() * 2 - 1 }));
        Score.Set("damage", hurtEntity, damage + scoreDamage);
        Score.Set("damage_ct_cl", hurtEntity, 20);

        damageDisplay.nameTag = "§l§a" + Math.floor(damage + scoreDamage).toString();
    }
});

system.runInterval(() => {
    world.getDimension("overworld").getEntities({ tags: ["ink"] }).forEach(entity => {
        entity.dimension.spawnParticle("spl:shot", entity.location);
        world.scoreboard.getObjective("ink_rd").addScore(entity, 0);
    });
});

world.afterEvents.projectileHitEntity.subscribe(ev => {
    const { projectile, source } = ev;
    const typeId = projectile.typeId;

    if (typeId !== `spl:damage` && typeId !== `spl:splash_ink`) {
        // ダメージ情報の取得
        const damageInfo = projectileDamageMap[typeId] || { bs_dmg: 0, rmv_dmg_divisor: 1 };
        const bs_dmg = damageInfo.bs_dmg;
        const rmv_dmg = Score.Get(`ink_rd`, projectile) / damageInfo.rmv_dmg_divisor;

        // ダメージの適用
        const entityHit = ev.getEntityHit().entity;
        const totalDamage = bs_dmg - rmv_dmg;

        // totalDamageがNaNでないかチェック
        if (isNaN(totalDamage)) return;

        if (world.getEntity(entityHit.id)) {
            if (entityHit.typeId === "minecraft:armor_stand" || projectileOwnerDataBase.get(projectile) === entityHit.id) return;
            entityHit.applyDamage(totalDamage, { cause: "suicide" });
        }

        if (world.getEntity(projectile.id)) projectile.kill();

        // ダメージを追跡
        Score.Add('hit_damage', source, totalDamage);
    }
});

world.afterEvents.projectileHitBlock.subscribe(({ location, projectile, dimension }) => {
    if (projectile.typeId === "spl:splash_ink") {
        dimension.fillBlocks(
            Vector.add(location, { x: -0.75, y: -0.75 - 1, z: -0.75 }),
            Vector.add(location, { x: 0.75, y: 0.75 - 1, z: 0.75 }),
            BlockPermutation.resolve("spl:ink_block_orange"),
            { matchingBlock: BlockPermutation.resolve("minecraft:stone") }
        );
        dimension.fillBlocks(
            Vector.add(location, { x: -0.75, y: -0.75 - 1, z: -0.75 }),
            Vector.add(location, { x: 0.75, y: 0.75 - 1, z: 0.75 }),
            BlockPermutation.resolve("spl:ink_block_orange"),
            { matchingBlock: BlockPermutation.resolve("spl:ink_block_darkgreen") }
        );
    }
    if (world.getEntity(projectile.id)) projectile.kill();
});
