#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:stone 0
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:basalt
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:cobbled_deepslate
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:concrete 7
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:deepslate
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:deepslate_tiles
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:hardened_clay
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:mangrove_planks
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:mud_bricks
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:packed_mud
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace minecraft:smooth_basalt
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace  minecraft:stone 1
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace  minecraft:stone 2
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace  minecraft:stained_hardened_clay 9
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace  minecraft:stained_hardened_clay 14
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace  minecraft:tuff
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_orange [] replace spl:ink_block_darkgreen
#execute at @s run fill ~ ~-1 ~ ~~-1~ spl:ink_block_black_slab [] replace stone_block_slab4 2
#execute at @s run fill ~ ~-1 ~ ~~-1~ minecraft:andesite_stairs [] replace normal_stone_stairs []
effect @a[tag=brush_p] speed 1 3 true
execute at @s run damage @e[type=!player,r=1.5] 40
scoreboard players remove @s ink 27
scoreboard players set @s ink_lock 7
execute at @s run particle spl:moves
execute at @s run playsound bucket.empty_water @s ~~~ 1 1.3 1