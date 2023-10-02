#スプラローラーメイン
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スコア定義
#スプラローラーを右クリした時間
scoreboard objectives add spl_rol_count dummy
#射撃時間
scoreboard objectives add spl_rol_time dummy
#射撃時間
scoreboard objectives add spl_rol_time_t dummy
#ヨコ振りクール
scoreboard objectives add spl_rol_cool_y dummy
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#ヨコ振り処理
scoreboard players add @a[tag=splatter_roller_shot,tag=!sneaking] spl_rol_count 1
tag @a[tag=!jump,scores={spl_rol_count=1,spl_rol_cool_y=..0}] add spl_rol_yoko_shot
scoreboard players add @a[tag=spl_rol_yoko_shot] spl_rol_time 1
execute as @a[scores={spl_rol_time=8,ink=850..}] run event entity @s spl:splatter_roller_yoko_01
execute as @a[scores={spl_rol_time=9,ink=850..}] run event entity @s spl:splatter_roller_yoko_02
execute as @a[scores={spl_rol_time=10,ink=850..}] run event entity @s spl:splatter_roller_yoko_03
execute as @a[scores={spl_rol_time=8,ink=..850}] run playsound random.click @s ~~~ 2 2
scoreboard players add @a[scores={spl_rol_time=8}] ink -850
scoreboard players add @a[scores={spl_rol_time=8}] ink_lock 15
scoreboard players add @a[scores={spl_rol_time=8}] spl_rol_cool_y 14
tag @a[scores={spl_rol_time=21..}] remove spl_rol_yoko_shot
scoreboard players set @a[tag=!spl_rol_yoko_shot] spl_rol_time 0
scoreboard players set @a[tag=!splatter_roller_shot] spl_rol_count 0
scoreboard players add @a[scores={spl_rol_cool_y=1..}] spl_rol_cool_y -1
scoreboard players set @a[tag=sneaking] spl_rol_count 0
execute at @e[type=spl:splatter_roller_ink] run particle spl:moves
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#タテ振り
tag @a[tag=jump,scores={spl_rol_count=1,spl_rol_cool_y=..0}] add spl_rol_tate_shot
scoreboard players add @a[tag=spl_rol_tate_shot] spl_rol_time_t 1
scoreboard players set @a[tag=!spl_rol_tate_shot] spl_rol_time_t 0
execute as @a[scores={spl_rol_time_t=8..12,ink=850..}] run event entity @s spl:splatter_roller_tate
scoreboard players add @a[scores={spl_rol_time_t=8,ink=850..}] ink -850
scoreboard players add @a[scores={spl_rol_time_t=8,ink=850..}] ink_lock 15
execute as @a[scores={spl_rol_time_t=8,ink=..850}] run playsound random.click @s ~~~ 2 2
tag @a[scores={spl_rol_time_t=12}] remove spl_rol_tate_shot
execute at @e[type=spl:splatter_roller_ink_tate] run particle spl:moves
#タテ振りインクの塗り処理、ダメージ処理、コロコロ変化、飛距離調整
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#コロコロ
tag @a[tag=!spl_rol_yoko_shot,scores={spl_rol_count=23..,ink=370..}] add spl_rol_corocoro 
execute at @a[tag=spl_rol_corocoro,tag=moves] run fill ~-1.5~-1~-1.5 ~1.5~-1~1.5 spl:ink_block_orange [] replace minecraft:stone
execute at @a[tag=spl_rol_corocoro,tag=moves] run fill ~-1.5~-1~-1.5 ~1.5~-1~1.5 spl:ink_block_orange [] replace spl:ink_block_darkgreen
execute at @a[tag=spl_rol_corocoro,tag=moves] run fill ~-1.5~-1~-1.5 ~1.5~-1~1.5 spl:ink_block_orange [] replace purpur_block
execute as @a[tag=spl_rol_corocoro,tag=moves] at @s run playsound step.stone @s ~~~ 1 0.7
scoreboard players add @a[tag=spl_rol_corocoro,tag=moves] ink -18
execute as @a[tag=spl_rol_corocoro,tag=moves] at @s positioned ^^^2 run damage @e[type=!player,r=2,rm=1] 25 suicide entity @s
execute as @a[tag=spl_rol_corocoro,tag=moves] at @s positioned ^^^2 if entity @e[type=!player,r=2,rm=1] run tag @s add back_knock
scoreboard players set @a[tag=spl_rol_corocoro] ink_lock 4
tag @a[tag=!splatter_roller_shot] remove spl_rol_corocoro
tag @a[tag=sneaking] remove spl_rol_corocoro
tag @a[scores={ink=..370}] remove spl_rol_corocoro
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#音
execute as @a[scores={spl_rol_time=1}] at @s run playsound mob.armor_stand.land @s ~~~ 2 0.6
execute as @a[scores={spl_rol_time=8}] at @s run playsound random.explode @s ~~~ 2 3
execute as @a[scores={spl_rol_time_t=1,ink=850..}] at @s run playsound mob.armor_stand.land @s ~~~ 2 0.6
execute as @a[scores={spl_rol_time_t=10,ink=850..}] at @s run playsound random.explode @s ~~~ 2 4
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#常時スコア増減
scoreboard players add @a[tag=splatter_roller_shot,tag=!jump,tag=!sneaking] spl_rol_count 1

playsound mob.wither.spawn

