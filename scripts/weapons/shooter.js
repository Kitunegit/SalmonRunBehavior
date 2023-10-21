import { world, system, BlockPermutation } from "@minecraft/server";
import * as Score from "../getscore.js";

export class DropletsPattern {
  constructor(pattern) {
      this.pattern = pattern;
      this.current = Math.floor(Math.random() * pattern.length);
  }
  rand(initialLocation, maxSpawnCount = 5) {
      if (this.current >= this.pattern.length - 1) this.current = 0;
      else this.current += 1;
      return new Droplets(this.pattern[this.current], initialLocation, maxSpawnCount);
  }
}

export class Droplets {
  constructor(targetDistance, initialLocation, maxSpawnCount) {
      this.targetDistance = targetDistance;
      this.spawnCount = 0;
      this.maxSpawnCount = maxSpawnCount;
      this.lastLocation = initialLocation;
  }
  fly(entity) {
      if (Vector.distance(this.lastLocation, entity.location) > this.targetDistance && (this.spawnCount < this.maxSpawnCount)) {
          entity.dimension.spawnEntity("armor_stand", entity.location);
          this.spawnCount++;
          this.lastLocation = entity.location;
      }
  }
}

export const dropletsDataBase = new Map();

//武器データ
const WeaponsDatebase = {
  "spl:splatter_shot": {
      shotDelay: 2,
      useInk:92,
      eventName:"spl:splatter_shot",
      weaponType:"Shooter",
      DropletsPatterns:[3,9,6]
  }
};
//アイテムデータ渡す用
const playerUsingItemMap = new Map();

//右クリ開始
world.afterEvents.itemStartUse.subscribe(({ source, itemStack }) => {
    playerUsingItemMap.set(source, itemStack);
});

//右クリ終了
world.afterEvents.itemStopUse.subscribe(({ source }) => {
    playerUsingItemMap.delete(source);
});

system.runInterval(() => {

    world.getAllPlayers().forEach(player => {
        //情報取得
        const itemStack = playerUsingItemMap.get(player);
        if (!itemStack) return;
        {
          const weaponData = WeaponsDatebase[itemStack.typeId];
          
          if(Score.Get(`ink`,player) > weaponData.useInk && Score.Get(`shot_cool`,player) <= 0)
          {
            player.triggerEvent(weaponData.eventName)
            const droplets = weaponData[DropletsPatterns]
           Score.Set(`shot_cool`,player,weaponData.shotDelay)
           Score.Set(`ink`,Score.Get(`ink`,player)-player,weaponData.useInk);
           player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.6 });
           player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.8 });
          }
        }
    });
});
