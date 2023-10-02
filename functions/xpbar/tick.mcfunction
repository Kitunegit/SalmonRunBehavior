 scoreboard objectives add xpbar dummy
 scoreboard objectives add ink dummy
 scoreboard players set "$10" xpbar 10
 xp -10000L @s
 scoreboard players operation "$Diff" xpbar = @s ink
 scoreboard players operation "$Diff" xpbar /= "$10" xpbar
 xp 129l @s
 scoreboard players operation "$Levels" xpbar = "$Diff" xpbar
 execute if score "$Diff" xpbar matches 32..1024 run function xpbar/xp_point_2
 execute if score "$Diff" xpbar matches 1.. run function xpbar/xp_point_1
 
 xp -129l @s
 scoreboard players operation "$Levels" xpbar /= "$10" xpbar 
 execute if score "$Levels" xpbar matches 32..128 run function xpbar/xp_level_1
 execute if score "$Levels" xpbar matches 1.. run function xpbar/xp_level_2
stopsound @a random.levelup
