#インク処理
event entity @s spl:splatter_dualies_slide
scoreboard players add @s[m=a] ink -72
scoreboard players set @s ink_lock 7
scoreboard players set @s stcl_spldual 1
execute if score @s ink matches ..72 run tellraw @s {"rawtext":[{"text":"§l§cインク不足!"}]}
execute at @s if score @s ink matches ..72 run playsound random.click @a ~~~ 0.3
execute at @s if score @s ink matches ..72 run playsound random.click @a ~~~ 0.8
execute at @s if score @s ink matches 72.. run playsound mob.armor_stand.land @a ~~~ 2 1.5
execute at @s if score @s ink matches 72.. run playsound mob.armor_stand.land @a ~~~ 2 1
#function Inks/paint/shot_floor_paint
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■