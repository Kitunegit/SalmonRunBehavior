scoreboard objectives add ink_random dummy
scoreboard players random @s ink_random 0 3
execute at @s if entity @s[scores={ink_random=1}] run fill ~~-0.1~ ~~-0.1~ spl:ink_block_orange [] replace spl:ink_block_darkgreen
execute at @s if entity @s[scores={ink_random=1}] run fill ~~-0.1~ ~~-0.1~ spl:ink_block_orange [] replace minecraft:stone []