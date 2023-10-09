import { world, system, BlockPermutation } from "@minecraft/server";
import * as Score from "../getscore.js";

const shooterweaponsData = {
  "spl:splatter_shot": {
      shotDelay: 2,
      useInk:92,
      eventName:"spl:splatter_shot"
  }
};

world.afterEvents.itemStartUse.subscribe(ev => {
  const { itemStack, source } = ev;
  const weaponData = shooterweaponsData[itemStack.typeId];
  
  if(Score.Get(`ink`,source) > weaponData.useInk && Score.Get(`shot_cool`,source) < 0)
  {
    
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

