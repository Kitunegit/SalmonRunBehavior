scoreboard objectives add ink_random dummy
scoreboard objectives add ink_time dummy
scoreboard players add @e[type=spl:splatter_roller_ink] ink_time 1
tag @e[type=spl:splatter_shot_ink] add ink 
tag @e[type=spl:splatter_dualies_ink] add ink
tag @e[type=spl:splatter_charger_ink_p] add ink
tag @e[type=spl:splatter_spiner_ink] add ink
tag @e[type=spl:splatter_roller_ink,scores={ink_time=1..}] add ink
tag @e[type=spl:splatter_roller_ink_tate] add ink
tag @e[type=spl:brush_ink] add ink
tag @e[type=spl:splatter_charger_ink_no_charge] add ink
scoreboard players random @e[tag=ink] ink_random 0 30
#塗り発生
execute as @e[tag=ink,scores={ink_random=0..3}] run function Inks/paint/wall_paint_1
execute as @e[tag=ink,scores={ink_random=4..6}] run function Inks/paint/wall_paint_2
execute as @e[tag=ink,scores={ink_random=7..10}] run function Inks/paint/wall_paint_3
execute at @e[tag=ink,scores={ink_random=..30}] run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink] run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink] positioned ~1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink] positioned ~-1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink] positioned ~~~1 run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink] positioned ~~~-1 run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink_tate] run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink_tate] positioned ~1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink_tate] positioned ~-1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink_tate] positioned ~~~1 run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_roller_ink_tate] positioned ~~~-1 run function Inks/paint/floor_paint
execute at @e[tag=ink,scores={ink_random=..3}] positioned ~~~-1 run function Inks/paint/floor_paint
execute at @e[tag=ink,scores={ink_random=4..7}] positioned ~~~1 run function Inks/paint/floor_paint
execute at @e[tag=ink,scores={ink_random=8..11}] positioned ~1~~ run function Inks/paint/floor_paint
execute at @e[tag=ink,scores={ink_random=12..15}] positioned ~-1~~ run function Inks/paint/floor_paint
execute as @e[type=spl:brush_ink,scores={ink_random=..26}] run function Inks/paint/floor_paint
execute as @e[type=spl:splatter_charger_ink_p] at @s run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_charger_ink_p] positioned ~-1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_charger_ink_p] positioned ~1~~ run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_charger_ink_p] positioned ~~~1 run function Inks/paint/floor_paint
execute at @e[type=spl:splatter_charger_ink_p] positioned ~~~-1 run function Inks/paint/floor_paint
execute as @e[type=spl:splatter_charger_ink_no_charge] run function Inks/paint/floor_paint
#https://youtu.be/CTQWkQ14SjQ?t=2503