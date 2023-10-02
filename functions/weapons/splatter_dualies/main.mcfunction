#スコア定義
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
scoreboard objectives add slide_timer dummy
scoreboard objectives add slide_cool dummy
scoreboard objectives add slide_use_count dummy
scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy
scoreboard objectives add stcl_spldual dummy
scoreboard objectives add slide_shot_count dummy
scoreboard players add @a stcl_spldual 0
scoreboard players add @a slide_cool 0
scoreboard players add @a slide_use_count 0
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スライドしたらスコアを変化させる
scoreboard players add @a[tag=slide] slide_timer 1
scoreboard players add @a[tag=slide,scores={slide_timer=1}] ink -700
scoreboard players add @a[tag=slide,scores={slide_timer=1}] ink_lock 6
scoreboard players add @a[tag=slide,scores={slide_timer=1}] stcl_spldual 1
scoreboard players set @a[tag=slide,scores={slide_timer=1}] slide_cool 2
scoreboard players add @a[tag=slide,scores={slide_timer=1}] slide_use_count -1
playanimation @a[tag=slide,scores={slide_timer=1}] slide_animation
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スライド処理
execute as  @a[tag=slide] at @s run particle spl:moves
scoreboard players add @a[scores={slide_cool=..-20,slide_use_count=..1}] slide_use_count 1
execute as @a[tag=slide,scores={slide_timer=1}] at @s run playsound random.explode @a ~~~ 1 3
tag @a[tag=slide,scores={slide_timer=1..3}] add slide_move
tag @a[scores={slide_timer=5..}] remove slide
scoreboard players reset @a[tag=!slide] slide_timer
execute as @a[tag=splatter_dualies_shot,scores={ink=72..,stcl_spldual=..0,x=0,z=0},tag=!sneaking,tag=!slide_shot] at @s run function weapons/splatter_dualies/shot
execute as @a[tag=splatter_dualies_shot,scores={ink=72..,stcl_spldual=..0},tag=moves,tag=!jump,tag=!sneaking,tag=!slide_shot] at @s run function weapons/splatter_dualies/shot
execute as @a[tag=splatter_dualies_shot,scores={ink=700..,slide_cool=..0,slide_use_count=1..},tag=moves,tag=jump] at @s run tag @s add slide
#常時スコア減算
scoreboard players remove @a[scores={slide_cool=-20..}] slide_cool 1
scoreboard players remove @a[scores={stcl_spldual=1..}] stcl_spldual 1

#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スライドショットかどうか検知処理
tag @a[tag=slide] add slide_shot

scoreboard players add @a[tag=slide_shot] slide_shot_count 1
scoreboard players set @a[tag=!slide_shot] slide_shot_count 0 
tag @a[scores={slide_shot_count=20..,x=..-5}] remove slide_shot
tag @a[scores={slide_shot_count=20..,x=5..}] remove slide_shot
tag @a[scores={slide_shot_count=20..,z=5..}] remove slide_shot
tag @a[scores={slide_shot_count=20..,z=..-5}] remove slide_shot
tag @a[tag=!splatter_dualies_shot] remove slide_shot

replaceitem entity @a[tag=slide_shot] slot.weapon.offhand 0 spl:empty
replaceitem entity @a[tag=!slide_shot,hasitem={item=spl:empty,location=slot.weapon.offhand}]  slot.weapon.offhand 0 minecraft:air

execute as @a[tag=slide_shot,scores={ink=72..,stcl_spldual=..0}] run function weapons/splatter_dualies/slide_shot