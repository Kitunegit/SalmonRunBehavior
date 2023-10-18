import { world, system, BlockPermutation } from "@minecraft/server";
import * as Score from "../getscore.js";

const WeaponsDatebase = {
  "spl:splatter_shot": {
      shotDelay: 2,
      useInk:92,
      eventName:"spl:splatter_shot",
      weaponType:"Shooter"
  }
};
const playerUsingItemMap = new Map();

world.afterEvents.itemStartUse.subscribe(({ source, itemStack }) => {
    playerUsingItemMap.set(source, itemStack);
});

world.afterEvents.itemStopUse.subscribe(({ source }) => {
    playerUsingItemMap.delete(source);
});
system.runInterval(() => {
    world.getAllPlayers().forEach(player => {
        const itemStack = playerUsingItemMap.get(player);
        if (!itemStack) return;
        {
          const weaponData = WeaponsDatebase[itemStack.typeId];
          
          if(Score.Get(`ink`,player) > weaponData.useInk && Score.Get(`shot_cool`,player) <= 0)
          {
            player.triggerEvent(weaponData.eventName)
           Score.Set(`shot_cool`,player,weaponData.shotDelay)
           player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.6 });
           player.playSound("mob.armor_stand.land", { volume: 1, pitch: 0.8 });
          }
        }
    });
});
