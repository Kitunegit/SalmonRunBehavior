summon minecraft:armor_stand check
tp @s 32 75 -32
structure save "armk_ntd_1" -64 26 -128 0 26 -64 memory 
structure save "armk_ntd_2" 0 26 -128 64 26 -64 memory 
structure save "armk_ntd_3" 64 26 -128 128 26 -64 memory 
structure save "armk_ntd_4" -64 26 -64 0 26 0 memory 
structure save "armk_ntd_5" 0 26 -64 64 26 0 memory 
structure save "armk_ntd_6" 64 26 -64 128 26 0 memory 
structure save "armk_ntd_7" -64 26 0 0 26 64 memory 
structure save "armk_ntd_8" 0 26 0 64 26 64 memory 
structure save "armk_ntd_9" 64 26 0 128 26 64 memory 
execute as @s at @s run tp @s @e[name=check]
kill @e[name=check]
say save!