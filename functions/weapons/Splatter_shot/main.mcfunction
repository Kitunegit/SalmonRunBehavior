#以下使用スコア
#スプラシューター射撃感覚設定
scoreboard objectives add stcl_splshot dummy
#足元塗りの発生カウント
scoreboard objectives add splshot_fpct dummy
#常時加算スコア
scoreboard objectives add ink_tick dummy
#ダメージ減算用カウンター
scoreboard objectives add ink_tick_ct dummy
#途中インク乱数
scoreboard objectives add random_p dummy
#初期値設定
scoreboard players add @a splshot_fpct 0
scoreboard players add @a stcl_splshot 0
scoreboard players add @e[type=spl:splatter_shot_ink] ink_rd 0
#射撃間隔のカウントダウン
scoreboard players add @a[scores={stcl_splshot=1..}] stcl_splshot -1
#途中にインク落とす
scoreboard players add @e[type=spl:splatter_shot_ink] ink_tick 1
scoreboard players add @e[type=spl:splatter_shot_ink,scores={ink_tick=3..}] ink_tick_ct 1
#scoreboard players add @e[type=spl:splatter_shot_ink,scores={ink_tick_ct=2,ink_rd=..4}] ink_rd 1
scoreboard players set @e[type=spl:splatter_shot_ink,scores={ink_tick_ct=2}] ink_tick_ct 0
scoreboard players random @e[type=spl:splatter_shot_ink,scores={ink_tick=1}] random_p 1 20
#execute as @e[type=spl:splatter_shot_ink] if score @s ink_tick = @s random_p at @s run fill ~-0.75~~-0.75 ~0.75~-5~0.75 spl:ink_block_orange [] replace minecraft:stone
execute as @e[type=spl:splatter_shot_ink] if score @s ink_tick = @s random_p at @s run particle spl:hit ~~-2~
#execute as @e[type=spl:splatter_shot_ink] if score @s ink_tick = @s random_p at @s run fill ~-0.75~~-0.75 ~0.75~-5~0.75 spl:ink_block_orange [] replace minecraft:purpur_block

#射撃
execute as @a[tag=splatter_shooting,scores={ink=92..,stcl_splshot=..0},tag=!sneaking] at @s run function weapons/Splatter_shot/shot
#パーティクル
execute at @e[type=spl:splatter_shot_ink,scores={ink_tick=1..2}] run particle spl:shot