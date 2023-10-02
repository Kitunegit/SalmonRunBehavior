#スニークしてたら実行
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#イカ表示
execute as @a[tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_orange run clear @s spl:Squid_armor
execute as @a[tag=sneaking] at @s positioned ~~0.2~ rotated ~ 0 if block ^^^0.5 spl:ink_block_orange 0 run clear @s spl:Squid_armor
execute as @a[tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_black_slab run clear @s spl:Squid_armor
execute as @a[tag=sneaking] at @s if block ~~-0.1~ minecraft:andesite_stairs run clear @s spl:Squid_armor
execute as @a[tag=sneaking] at @s unless block ~~-0.1~ spl:ink_block_orange unless block ~~-0.1~ spl:ink_block_black_slab unless block ~~-0.1~ minecraft:andesite_stairs positioned ~~0.2~ rotated ~ 0 unless block ^^^1 spl:ink_block_orange run replaceitem entity @s slot.weapon.offhand 0 spl:Squid_armor
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スピードエフェクト
execute as @a[tag=sneaking] at @s if block ~~-0.1~ minecraft:stone 0 run effect @s speed 0 255 true
execute as @a[tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_orange run effect @s speed 1 20 true
execute as @a[tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_black_slab run effect @s speed 1 20 true
execute as @a[tag=sneaking] at @s if block ~~-0.1~ minecraft:andesite_stairs run effect @s speed 1 20 true
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#インク回復
execute as @a[scores={ink=..10000,ink_lock=..0},tag=sneaking] at @s unless block ~~-0.1~ spl:ink_block_orange unless block ~~-0.1~ spl:ink_block_black_slab run scoreboard  players add @s ink 50
execute as @a[scores={ink=..10000,ink_lock=..0},tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_orange run scoreboard  players add @s ink 166
execute as @a[scores={ink=..10000,ink_lock=..0},tag=sneaking] at @s if block ~~-0.1~ spl:ink_block_black_slab run scoreboard  players add @s ink 166
execute as @a[scores={ink=..10000,ink_lock=..0},tag=sneaking] at @s if block ~~-0.1~ minecraft:andesite_stairs run scoreboard players add @s ink 166
scoreboard players set @a[scores={ink=10000..}] ink 10000
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#体力回復
execute as @a[tag=sneaking,scores={heel_cool=..0}] at @s if block ~~-0.1~ spl:ink_block_orange run effect @s regeneration 1 4 true
execute as @a[tag=sneaking,scores={heel_cool=..0}] at @s if block ~~-0.1~ spl:ink_block_black_slab run effect @s regeneration 1 4 true
execute as @a[tag=sneaking,scores={heel_cool=..0}] at @s if block ~~-0.1~ minecraft:andesite_stairs run effect @s regeneration 1 4 true
scoreboard players set @a[scores={heel_cool=..0},tag=sneaking] heel_cool 15
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#壁登り
execute as @a[tag=sneaking,tag=jump] at @s positioned ~~0.2~ rotated ~ 0 if block ^^^0.5 spl:ink_block_orange run effect @s levitation 1 8 true
execute as @a[tag=sneaking,tag=jump] at @s positioned ~~0.2~ rotated ~ 0 unless block ^^^0.5 spl:ink_block_orange run effect @s levitation 0 255 true
effect @a[tag=!jump] levitation 0 255 true
effect @a[tag=!sneaking] levitation 0 255 true

#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#インク遊泳パーティクル
execute as @a[tag=sneaking,tag=moves] at @s if block ~~-0.1~ spl:ink_block_orange run particle spl:moves
execute as @a[tag=sneaking,tag=moves] at @s if block ~~-0.1~ spl:ink_block_black_slab run particle spl:moves
execute as @a[tag=sneaking,tag=moves] at @s positioned ~~0.2~ rotated ~ 0 if block ^^^0.5 spl:ink_block_orange run particle spl:moves
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#execute as @a[tag=sneaking,tag=moves] at @s unless block ~~-0.1~ spl:ink_block_orange unless block ~~-0.1~ spl:ink_block_black_slab run playanimation @s squid_annimation