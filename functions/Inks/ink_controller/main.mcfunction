#パーティクル
execute as @e[type=spl:brush_ink] at @s run particle spl:brush
scoreboard players add @e[type=spl:splatter_shot_ink,scores={ink_rd=..36}] ink_rd 1
scoreboard players set @e[type=spl:splatter_shot_ink,scores={ink_rd=36..}] ink_rd 36
scoreboard players add @e[type=spl:splatter_spiner_ink,scores={ink_rd=..10}] ink_rd 1
scoreboard players add @e[type=spl:splatter_dualies_ink,scores={ink_rd=..10}] ink_rd 1
scoreboard players set @e[type=spl:splatter_dualies_ink,scores={ink_rd=11..}] ink_rd 11
scoreboard players add @e[type=spl:brush_ink,scores={ink_rd=..21}] ink_rd 5
#a
scoreboard players add @e[type=spl:damage] damage_time 1
tag @e[type=spl:dummy] add enemy
tag @e[type=spl:big_salmon] add enemy
tag @e[type=spl:salmon] add enemy
tag @e[type=spl:small_salmon] add enemy
scoreboard players add @e[tag=enemy] dmg_ct_cl 0
scoreboard players add @e[tag=enemy,scores={dmg_ct_cl=1..}] dmg_ct_cl -1
scoreboard players set @e[scores={dmg_ct_cl=0}] damage 0
execute as @e[scores={dmg_ct_cl=1}] at @s run playsound random.orb @a[r=10] ~~~ 5 1 
execute as @e[type=spl:damage,scores={damage_time=..4}] at @s run tp @s ~~0.1~
execute as @e[type=spl:damage,scores={damage_time=5..}] at @s run tp @s ~~0.8~