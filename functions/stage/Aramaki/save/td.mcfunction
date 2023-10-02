summon minecraft:armor_stand check
tp @s 32 75 -32
structure save "armk_td_1" -64 26 -128 -1 76 -65 disk
structure save "armk_td_2" 0 26 -128 63 76 -65 disk
structure save "armk_td_3" 64 26 -128 127 76 -65 disk
structure save "armk_td_4" -64 26 -64 -1 76 -1 disk
structure save "armk_td_5" 0 26 -64 63 76 -1 disk
structure save "armk_td_6" 64 26 -64 127 76 -1 disk
structure save "armk_td_7" -64 26 0 -1 76 63 disk
structure save "armk_td_8" 0 26 0 63 76 63 disk
structure save "armk_td_9" 64 26 0 127 76 63 disk
execute as @s at @s run tp @s @e[name=check]
kill @e[name=check]
say save!