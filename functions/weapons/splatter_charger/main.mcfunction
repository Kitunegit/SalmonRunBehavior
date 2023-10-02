# 
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#射線表示スコア
scoreboard objectives add countTime dummy
#チャージャー時間カウントスコア
scoreboard objectives add spl_chrgr_count dummy
#チャージ時間リセットスコア
scoreboard objectives add spl_chrgr_reset dummy
#インク塗りよう
scoreboard objectives add spl_chrgr_ink dummy
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#右クリックしてたらスコア増加
execute as @a if entity @s[tag=splatter_charger_shot,scores={ink=1800..},tag=!y_move] run scoreboard players add @s spl_chrgr_count 3
execute as @a if entity @s[tag=splatter_charger_shot,scores={ink=..1800}] run scoreboard players add @s spl_chrgr_count 1
execute as @a if entity @s[tag=splatter_charger_shot,tag=y_move] run scoreboard players add @s spl_chrgr_count 1
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#常時スコア増減
scoreboard players add @a[scores={spl_chrgr_reset=1..}] spl_chrgr_reset -1
scoreboard players set @a[scores={spl_chrgr_count=1..}] ink_lock 2
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#チャージ時間によって射程を変える
#fullCharge
tag @a[scores={spl_chrgr_count=60..}] add spl_chrgr_shot 
#NoCharge
tag @a[scores={spl_chrgr_count=1..59}] add spl_chrgr_shot_nocharge
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#チャージ音
execute as @a[scores={spl_chrgr_count=3..9}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 0.5
execute as @a[scores={spl_chrgr_count=10..18}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 0.7
execute as @a[scores={spl_chrgr_count=19..27}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 1
execute as @a[scores={spl_chrgr_count=28..36}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 1.3
execute as @a[scores={spl_chrgr_count=37..45}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 1.5
execute as @a[scores={spl_chrgr_count=46..59}] at @s run playsound click_off.nether_wood_button @a ~~~ 1 2
execute as @a[scores={spl_chrgr_count=60..63}] at @s run playsound random.orb @a ~~~ 1 2
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#ノーチャージ処理
execute as @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0},tag=!sneaking] at @s run event entity @s spl:splatter_charger_nocharge
execute as @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0,ink=..225},m=a] at @s run playsound random.click @a ~~~ 4 2
execute as @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0,ink=..225},m=a] at @s run playsound random.click @a ~~~ 4 1
execute as @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0,ink=225..},tag=!sneaking] at @s run playsound random.explode @a ~~~ 1 4
execute as @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0,ink=225..},tag=!sneaking] at @s run scoreboard players set @s ink_lock 20
scoreboard players add @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0,ink=225..},m=a] ink -225
tag @a[tag=spl_chrgr_shot_nocharge,scores={spl_chrgr_count=0}] remove spl_chrgr_shot_nocharge
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#フルチャージ処理
execute as @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0}] at @s run event entity @s spl:splatter_charger_fullcharge
execute as @a[scores={spl_chrgr_ink=1},tag=spl_chrgr_shot] at @s run event entity @s spl:splatter_charger_fullcharge_p
execute as @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0,ink=..1800},m=a] at @s run playsound random.click @a ~~~ 4 2
execute as @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0,ink=..1800},m=a] at @s run playsound random.click @a ~~~ 4 1
execute as @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0,ink=..1800}] at @s run fill ^-2^-4^ ^2^5^24 spl:ink_block_orange [] replace minecraft:stone
scoreboard players add @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0,ink=1800..},m=a] ink -1800
execute as @a[tag=spl_chrgr_shot,scores={spl_chrgr_count=0,ink=1800..}] at @s run playsound random.explode @a ~~~ 1 3
scoreboard players add @a[scores={spl_chrgr_count=0}] spl_chrgr_ink 1
scoreboard players set @a[scores={spl_chrgr_count=1..}] spl_chrgr_ink 0
tag @a[tag=spl_chrgr_shot,scores={spl_chrgr_ink=2}] remove spl_chrgr_shot
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#チャージキャンセル処理
scoreboard players set @a[tag=sneaking] spl_chrgr_count 0
tag @a[tag=sneaking] remove splatter_charger_shot

#playanimation @a[hasitem={item=spl:splatter_charger,location=slot.weapon.mainhand},scores={spl_chrgr_count=0}] charger_hold
#playanimation @a[hasitem={item=spl:splatter_charger,location=slot.weapon.mainhand},scores={spl_chrgr_count=1..}] charger_shot