#敵インク⇨自インク壁変換
execute  at @s if block ~1~~ spl:ink_block_darkgreen run fill ~1~~ ~1~~ spl:ink_block_orange
execute  at @s if block ~-1~~ spl:ink_block_darkgreen run fill ~-1~~ ~-1~~ spl:ink_block_orange
execute  at @s if block ~~~1 spl:ink_block_darkgreen run fill ~~~1 ~~~1 spl:ink_block_orange
execute  at @s if block ~~~-1 spl:ink_block_darkgreen run fill ~~~-1 ~~~-1 spl:ink_block_orange
#敵インクハーフ⇨自インクハーフ変換
execute  at @s if block ~1~~ stone_block_slab4 2 run fill ~1~~ ~1~~ spl:ink_block_black_slab
execute  at @s if block ~-1~~ stone_block_slab4 2 run fill ~-1~~ ~-1~~ spl:ink_block_black_slab
execute  at @s if block ~~~1 stone_block_slab4 2 run fill ~~~1 ~~~1 spl:ink_block_black_slab
execute  at @s if block ~~~-1 stone_block_slab4 2 run fill ~~~-1 ~~~-1 spl:ink_block_black_slab
#インク無階段⇨インク付き階段data値0
execute  at @s if block ~1~~ normal_stone_stairs 0 run fill ~1~~ ~1~~ minecraft:andesite_stairs
execute  at @s if block ~-1~~ normal_stone_stairs 0 run fill ~-1~~ ~-1~~ minecraft:andesite_stairs
execute  at @s if block ~~~1 normal_stone_stairs 0 run fill ~~~1 ~~~1 minecraft:andesite_stairs
execute  at @s if block ~~~-1 normal_stone_stairs 0 run fill ~~~-1 ~~~-1 minecraft:andesite_stairs