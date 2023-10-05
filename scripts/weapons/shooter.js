import { world, system, BlockPermutation } from "@minecraft/server";
import * as Score from "../getscore.js";
/*const itemTagMap = {
  "spl:splatter_shot": "splatter_shooting",
  "spl:splatter_dualies": "splatter_dualies_shot",
  "spl:splatter_charger": "splatter_charger_shot",
  "spl:splatter_spiner": "splatter_spiner_shot",
  "spl:splatter_roller": "splatter_roller_shot",
  "spl:brush": "brush_shot"
};*/
world.afterEvents.itemStartUse.subscribe(ev => {
  /*  const { itemStack, source } = ev;
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
  }*/
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
const shooterweaponsData = {
  splatter_shot: {
      weaponId: "splatter_shot",
      shotDelay: 2,
      useInk:92
  }
};
