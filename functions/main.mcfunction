 execute as @a run function xpbar/tick
 function Inks/ink_controller/main
 execute if entity @a[hasitem={item=spl:splatter_shot,location=slot.weapon.mainhand}] run function weapons/Splatter_shot/main
 execute if entity @a[hasitem={item=spl:splatter_dualies,location=slot.weapon.mainhand}] run function weapons/splatter_dualies/main
 execute if entity @a[hasitem={item=spl:splatter_charger,location=slot.weapon.mainhand}] run function weapons/splatter_charger/main
 execute if entity @a[hasitem={item=spl:splatter_spiner,location=slot.weapon.mainhand}] run function weapons/splatter_spiner/main
 execute if entity @a[hasitem={item=spl:splatter_roller,location=slot.weapon.mainhand}] run function weapons/splatter_roller/main
 execute if entity @a[hasitem={item=spl:brush,location=slot.weapon.mainhand}] run function weapons/brush/main
 execute as @a unless entity @s[hasitem={item=spl:splatter_charger,location=slot.weapon.mainhand}] run tag @s remove spl_chrgr_shot
 execute as @a unless entity @s[hasitem={item=spl:splatter_charger,location=slot.weapon.mainhand}] run tag @s remove spl_chrgr_shot_nocharge
 #function Inks/main
 function Inks/Squid_controller
 
 execute as @e[type=spl:salmon] at @s run fill ~~-0.1~ ~~-0.1~ spl:ink_block_darkgreen [] replace stone []
  execute as @e[type=spl:salmon] at @s run fill ~~-0.1~ ~~-0.1~ spl:ink_block_darkgreen [] replace spl:ink_block_orange
 execute as @e[type=spl:small_salmon] at @s run fill ~~-0.1~ ~~-0.1~ spl:ink_block_darkgreen [] replace stone []
 execute as @e[type=spl:small_salmon] at @s run fill ~~-0.1~ ~~-0.1~ spl:ink_block_darkgreen [] replace spl:ink_block_orange
 execute as @e[type=spl:big_salmon] at @s run fill ~-1~-0.1~-1 ~1~-0.1~1 spl:ink_block_darkgreen [] replace stone []
 execute as @e[type=spl:big_salmon] at @s run fill ~-1~-0.1~-1 ~1~-0.1~1 spl:ink_block_darkgreen [] replace spl:ink_block_orange
 #titleraw @a actionbar {"rawtext":[{"text":"shooting:"},{"selector":"@a[tag=brush_shot]"}]}
 fill -63 27 62 126 27 -34 spl:face_water [] replace water
 fill -63 28 62 126 28 -34 spl:face_water [] replace water
 fill -63 29 62 126 29 -34 spl:face_water [] replace water
 fill -63 30 62 126 30 -34 spl:face_water [] replace water
 fill -63 31 62 126 31 -34 spl:face_water [] replace water
 fill -63 32 62 126 32 -34 spl:face_water [] replace water
 fill -63 33 62 126 33 -34 spl:face_water [] replace water
 fill -63 34 62 126 34 -34 spl:face_water [] replace water
 fill -63 35 62 126 35 -34 spl:face_water [] replace water
 fill -63 36 62 126 36 -34 spl:face_water [] replace water
 
 fill -63 27 -127 126 27 -34 spl:face_water [] replace water
 fill -63 28 -127 126 28 -34 spl:face_water [] replace water
 fill -63 29 -127 126 29 -34 spl:face_water [] replace water
 fill -63 30 -127 126 30 -34 spl:face_water [] replace water
 fill -63 31 -127 126 31 -34 spl:face_water [] replace water
 fill -63 32 -127 126 32 -34 spl:face_water [] replace water
 fill -63 33 -127 126 33 -34 spl:face_water [] replace water
 fill -63 34 -127 126 34 -34 spl:face_water [] replace water
 fill -63 35 -127 126 35 -34 spl:face_water [] replace water
 fill -63 36 -127 126 36 -34 spl:face_water [] replace water



function stage/main


tellraw @a[hasitem={item=spl:tuyoi_shot},tag=!get] {"rawtext":[{"text":"きつねさん以外は使用禁止だぞ！"}]}
clear @a[hasitem={item=spl:tuyoi_shot},tag=!get] spl:tuyoi_shot


execute as @a at @s if entity @s[y=~1.5,dx=0] run tag @s remove sneaking
execute as @a at @s if entity @s[y=~1.4,dx=0] unless entity @s[y=~1.5,dx=0] run tag @s add sneaking
tag @a[scores={y=4..,x=20..},tag=!xzJump,tag=sneaking] add lowJump
tag @a[scores={y=4..,z=20..},tag=!xzJump,tag=sneaking] add lowJump
tag @a[scores={y=4..,z=..-20},tag=!xzJump,tag=sneaking] add lowJump
tag @a[scores={y=4..,x=..-20},tag=!xzJump,tag=sneaking] add lowJump

#execute as @a run titleraw @s actionbar {"rawtext":[{"text":"x:"},{ "score": {"name": "@s", "objective": "x" }},{"text":"\ny:"},{ "score": {"name": "@s", "objective": "y" }},{"text":"\nz:"},{ "score": {"name": "@s", "objective": "z" }}]}