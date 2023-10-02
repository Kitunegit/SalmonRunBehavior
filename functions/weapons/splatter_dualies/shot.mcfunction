#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スコア定義
scoreboard objectives add spl_dual_rot dummy
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#左右交互にインクが出るようにする処理
scoreboard players set @a[scores={spl_dual_rot=2}] spl_dual_rot 0
scoreboard players set @s stcl_spldual 2
scoreboard players add @s spl_dual_rot 1
execute as @s[scores={spl_dual_rot=1}] run event entity @s spl:splatter_dualies_left
execute as @s[scores={spl_dual_rot=2}] run event entity @s spl:splatter_dualies_right
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#インク処理
scoreboard players add @s[m=a] ink -72
scoreboard players set @s ink_lock 7
execute if score @s ink matches ..72 run tellraw @s {"rawtext":[{"text":"§l§cインク不足!"}]}
execute at @s if score @s ink matches ..72 run playsound random.click @a ~~~ 0.3
execute at @s if score @s ink matches ..72 run playsound random.click @a ~~~ 0.8
execute at @s if score @s ink matches 72.. run playsound mob.armor_stand.land @a ~~~ 2 1.5
execute at @s if score @s ink matches 72.. run playsound mob.armor_stand.land @a ~~~ 2 1
#function Inks/paint/shot_floor_paint
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■