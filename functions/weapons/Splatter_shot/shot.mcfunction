event entity @s spl:splatter_shot
scoreboard players add @s[m=a] ink -92
scoreboard players set @s ink_lock 6
scoreboard players set @s stcl_splshot 2
scoreboard players add @s splshot_fpct 1
execute at @s if score @s splshot_fpct matches 8 rotated ~ 0 positioned ~ ~-1 ~ run fill ^-0.25^^3 ^0.25^^ spl:ink_block_orange [] replace minecraft:stone
execute at @s if score @s splshot_fpct matches 8 rotated ~ 0 positioned ~ ~-1 ~ run fill ^-0.25^^3 ^0.25^^ spl:ink_block_orange [] replace minecraft:purpur_block
execute at @s if score @s splshot_fpct matches 16 rotated ~ 0 positioned ~ ~-1 ~ run fill ^-0.25^^3 ^0.25^^ spl:ink_block_orange [] replace minecraft:stone
execute at @s if score @s splshot_fpct matches 16 rotated ~ 0 positioned ~ ~-1 ~ run fill ^-0.25^^3 ^0.25^^ spl:ink_block_orange [] replace minecraft:purpur_block
execute if score @s splshot_fpct matches 16.. run scoreboard players set @s splshot_fpct 0
execute if score @s ink matches ..92 run tellraw @s {"rawtext":[{"text":"§l§cインク不足!"}]}
execute at @s if score @s ink matches ..92 run playsound random.click @a ~~~ 0.3
execute at @s if score @s ink matches ..92 run playsound random.click @a ~~~ 0.8
execute at @s if score @s ink matches 92.. run playsound mob.armor_stand.land @a ~~~ 2 0.8
execute at @s if score @s ink matches 92.. run playsound mob.armor_stand.land @a ~~~ 2 0.6
#function Inks/paint/shot_floor_paint
playsound ghast