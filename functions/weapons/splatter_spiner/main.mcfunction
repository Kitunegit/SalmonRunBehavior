#スコア定義
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
scoreboard objectives add spl_spiner_count dummy
scoreboard objectives add spl_spiner_shot dummy
scoreboard objectives add ink_random dummy
scoreboard objectives add spl_spiner_2 dummy
scoreboard players set "$3" spl_spiner_2 4
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#チャージ打ち処理
scoreboard players set @a[tag=sneaking] spl_spiner_shot 0
scoreboard players set @a[tag=!splatter_spiner_shot] spl_spiner_count 0 
execute as @a[tag=splatter_spiner_shot,scores={spl_spiner_shot=0}] run function weapons/splatter_spiner/charge
#長押し時間によって半チャかフルチャージかの検知
tag @a[scores={spl_spiner_count=1..29}] add half_spl_spiner_charge
tag @a[scores={spl_spiner_count=30..}] add full_spl_spiner_charge
tag @a[tag=full_spl_spiner_charge] remove half_spl_spiner_charge
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#フルチャージ処理
#射撃時間を設定し、タグ消し
scoreboard players set @a[tag=full_spl_spiner_charge,scores={spl_spiner_count=0}] spl_spiner_shot 24
tag @a[tag=full_spl_spiner_charge,scores={spl_spiner_count=0}] remove full_spl_spiner_charge
#射撃時間があったら射撃し、インクを減らして、射撃時間を減らす
execute as @a[scores={spl_spiner_shot=1..}] at @s run event entity @s spl:splatter_spiner
scoreboard players remove @a[scores={spl_spiner_shot=1..}] spl_spiner_shot 1
scoreboard players remove @a[scores={spl_spiner_shot=1..}] ink 71
scoreboard players set @a[scores={spl_spiner_shot=1..}] ink_lock 10
scoreboard players set @a[scores={spl_spiner_count=1..}] ink_lock 2
scoreboard players set @a[scores={spl_spiner_count=1..}] spl_spiner_shot 0
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
execute as @a[tag=half_spl_spiner_charge,scores={spl_spiner_count=1..}] run scoreboard players operation @s spl_spiner_2 = @s spl_spiner_count
execute as @a[tag=half_spl_spiner_charge,scores={spl_spiner_count=0}] run scoreboard players operation @s spl_spiner_shot = @s spl_spiner_2
execute as @a[tag=half_spl_spiner_charge,scores={spl_spiner_count=0}] run scoreboard players operation @s spl_spiner_shot /= "$3" spl_spiner_2
tag @a[tag=half_spl_spiner_charge,scores={spl_spiner_count=0}] remove half_spl_spiner_charge
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#チャージ中と発射中に音を出す
execute as @a[scores={spl_spiner_shot=1..}] at @s run playsound mob.armor_stand.land @a ~~~ 2 0.3
execute as @a[scores={spl_spiner_shot=1..}] at @s run playsound mob.armor_stand.land @a ~~~ 2 0.8
#execute as @a[scores={spl_spiner_shot=1..}] at @s run function Inks/paint/shot_floor_paint
execute as @a[scores={spl_spiner_count=3..6,ink=1725..}] at @s run playsound block.lantern.hit @a ~~~ 0.7 0.5
execute as @a[scores={spl_spiner_count=7..15,ink=1725..}] at @s run playsound block.lantern.hit @a ~~~ 0.7 0.9
execute as @a[scores={spl_spiner_count=16..29,ink=1725..}] at @s run playsound block.lantern.hit @a ~~~ 0.7 1.1
execute as @a[scores={spl_spiner_count=30}] at @s run playsound random.orb @a ~~~ 0.7 1.5
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■