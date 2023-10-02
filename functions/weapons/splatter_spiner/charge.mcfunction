execute if score @s ink matches 1725.. if entity @s[tag=!y_move] run scoreboard players add @s spl_spiner_count 3
execute if score @s ink matches ..1725 run scoreboard players add @s spl_spiner_count 1
execute if entity @s[tag=y_move] run scoreboard players add @s spl_spiner_count 1
execute if score @s ink matches ..1725 at @s run playsound random.click @a ~~~ 3 1