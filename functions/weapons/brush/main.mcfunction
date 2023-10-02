scoreboard objectives add brush_count dummy
scoreboard objectives add brush_cool dummy
scoreboard objectives add brush_anm dummy
#右クリ検知
scoreboard players add @a[tag=brush_shot] brush_count 1
scoreboard players set @a[tag=!brush_shot] brush_count 0
scoreboard players add @a[scores={brush_count=1..}] brush_cool -1
#ばしゃばしゃ！！
scoreboard players add @a[scores={brush_count=1,ink=150..}] brush_anm 1
execute as @a[scores={brush_count=1,ink=150..}] at @s run event entity @s spl:brush
execute as @a[scores={brush_count=1,ink=150..}] at @s run event entity @s spl:brush
execute as @a[scores={brush_count=1,ink=150..,brush_anm=1}] at @s run playanimation @s brush_attack
execute as @a[scores={brush_count=1,ink=150..,brush_anm=2}] at @s run playanimation @s brush_attack2
execute as @a[scores={brush_count=1,ink=..150}] at @s run playsound random.click @a ~~~ 2 1 1
execute as @a[scores={brush_count=1,ink=150..}] at @s run playsound bucket.empty_water @a ~~~ 1 1.3 1
execute as @a[scores={brush_count=1,ink=150..}] at @s run playsound bucket.fill_water @a ~~~ 1 1.5 1
scoreboard players set @a[scores={brush_count=1,ink=150..}] ink_lock 10
scoreboard players add @a[scores={brush_count=1,ink=150..}] ink -150
scoreboard players set @a[scores={brush_count=1,ink=150..,brush_anm=2..}] brush_anm 0
#すー
execute as @a[scores={brush_count=5..}] at @s run tag @s add brush_p
execute as @a[scores={brush_count=0}] at @s run tag @s remove brush_p
execute as @a[tag=brush_p] run function weapons/brush/dash