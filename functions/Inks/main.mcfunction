#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#inkLock
scoreboard objectives add ink_lock dummy
scoreboard players add @a[scores={ink_lock=1..}] ink_lock -1 
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#掃除用弓
execute as @e[type=arrow] at @s unless block ~~-0.1~ air run kill @s 
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
execute as @e at @s if block ~~-0.1~ spl:face_water 0 run kill @s 
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#インク塗り
function Inks/paint/ink_paint