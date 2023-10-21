import { world, system, BlockPermutation, Vector, EntityInitializationCause } from "@minecraft/server";

import * as Score from "./getscore.js";

import "./weapons/shooter.js";

import { dropletsDataBase, DropletsPattern } from "./splatTest/index.js";

import { projectileOwnerDataBase } from "./weapons/shooter.js";

const overworld = world.getDimension(`overworld`);
const players = overworld.getPlayers();

system.runInterval(() => {
    const options = {};
    const HealthEntity = overworld.getEntities(options).filter(entity => entity.hasComponent("health"));
    for (const entity of HealthEntity) {
        const health = entity.getComponent("health");

        if (health.current != health.value && health.value === 100000000) {
            entity.nameTag = `§c§l${Math.round(health.current)}§r/§a${health.value}§c`;
        } else if (health.value === 100000000) {
            entity.nameTag = `§k§l§1aaa§r§l§0infinity§r§k§1aaa`;
        } else {
            entity.nameTag = ``;
        }
    }
    for(const player of players) {
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

world.afterEvents.entityHurt.subscribe(ev => {
    const { hurtEntity } = ev;
    
    if (/*hurtEntity?.typeId === `spl:dummy` && */ev.damage > 1) {
        let damage = Score.Get(`damage`, hurtEntity);
        
        const damageEntity = overworld.spawnEntity(`spl:damage`, {
            x: hurtEntity.location.x,
            y: hurtEntity.location.y + 0.2,
            z: hurtEntity.location.z+Math.random() * 2 - 1
        });
        Score.Set(`damage`, hurtEntity, damage + ev.damage);
        Score.Set(`damage_ct_cl`, hurtEntity, 20);
        
        damageEntity.nameTag = `§l§a${Math.floor(damage + ev.damage)}`;
    }
});

world.afterEvents.projectileHitEntity.subscribe(ev => {
  // プロジェクタイルのダメージ値マップ
    const damageMap = {
        "spl:splatter_shot_ink": { bs_dmg: 36, rmv_dmg_divisor: 6 },
        "spl:splatter_charger_ink": { bs_dmg: 25, rmv_dmg_divisor: 1 },
        "spl:splatter_dualies_ink": { bs_dmg: 6, rmv_dmg_divisor: 8 },
        "spl:splatter_spiner_ink": { bs_dmg: 6, rmv_dmg_divisor: 1 },
        "spl:splatter_charger_ink_no_charge": { bs_dmg: 8, rmv_dmg_divisor: 1 },
        "spl:brush_ink": { bs_dmg: 36, rmv_dmg_divisor: 1 },
        "spl:splatter_roller_ink": { bs_dmg: 13, rmv_dmg_divisor: 1 },
        "spl:splatter_roller_ink_tate": { bs_dmg: 13, rmv_dmg_divisor: 1 }
    };

    const projectile = ev.projectile;
    const typeId = projectile.typeId;

    if (typeId !== `spl:damage` && typeId !== `spl:splash_ink`) {
        // ダメージ情報の取得
        const damageInfo = damageMap[typeId] || { bs_dmg: 0, rmv_dmg_divisor: 1 };
        const bs_dmg = damageInfo.bs_dmg;
        const rmv_dmg = Score.Get(`ink_rd`, projectile) / damageInfo.rmv_dmg_divisor;

        // ダメージの適用
        const entityHit = ev.getEntityHit().entity;
        const totalDamage = bs_dmg - rmv_dmg;
        // totalDamageがNaNでないかチェック
        if (!isNaN(totalDamage) && world.getEntity(entityHit.id)) {
            if (entityHit.typeId === "minecraft:armor_stand" || projectileOwnerDataBase.get(projectile) === entityHit.id) return;
            entityHit.applyDamage(totalDamage, { cause: "suicide" });
        }
        else {
            // NaNの場合、エラーメッセージを出力またはデフォルト値を適用できます
            //console.error("Total damage is NaN. Check your calculations.");
            // あるいはデフォルト値を適用する場合
            // totalDamage = 0; など
        }

        projectile.kill();

        // ダメージを追跡
        let dmg = Score.Get('hit_damage', ev.source) + totalDamage;
        Score.Set('hit_damage', ev.source, dmg);
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


world.getAllPlayers().forEach(player => {
    dropletsDataBase.set(player, new DropletsPattern([3, 9, 6]));
});
