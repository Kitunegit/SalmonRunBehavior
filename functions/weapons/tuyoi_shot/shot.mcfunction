scoreboard objectives add stcl_tyshot dummy
event entity @s spl:tuyoi_shot
scoreboard players random @s ink_random 0 3
execute at @s if entity @s[scores={ink_random=1}] run fill ~~-0.1~ ~~-0.1~ spl:ink_block_orange [] replace spl:ink_block_darkgreen
execute at @s if entity @s[scores={ink_random=1}] run fill ~~-0.1~ ~~-0.1~ spl:ink_block_orange [] replace minecraft:stone 
scoreboard players add @s[m=a] ink -1

scoreboard players set @s ink_lock 0
scoreboard players set @s stcl_tyshot 0
execute if score @s ink matches ..1 run titleraw @s actionbar{"rawtext":[{"text":"§l§cインク不足!"}]}
execute at @s if score @s ink matches ..1 run playsound random.click @s ~~~ 0.3
execute at @s if score @s ink matches ..1 run playsound random.click @s ~~~ 0.8
execute at @s if score @s ink matches 1.. run playsound mob.armor_stand.land @s ~~~ 2 0.8
execute at @s if score @s ink matches 1.. run playsound mob.armor_stand.land @s ~~~ 2 0.6
