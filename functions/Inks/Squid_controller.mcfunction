# 
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#回復間隔スコア
scoreboard objectives add heel_cool dummy
#ダメージ間隔スコア
scoreboard objectives add damage_cool dummy
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#初期地設定
scoreboard players set @a[tag=!set] heel_cool 0 
scoreboard players set @a[tag=!set] damage_cool 0 
scoreboard players set @a[tag=!set] ink 10000
scoreboard players set @a[tag=!set] slide_use_count 2
scoreboard players set @a[tag=!set] stcl_spldual 0
scoreboard players set @a[tag=!set] stcl_splshot 0
#初期値設定フラグ
tag @a add set
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#moveタグ
#x方向に動いてたらタグ
tag @a[scores={x=1..}] add x_move
#x方向に動いてたらタグ
tag @a[scores={x=..-1}] add x_move
#z方向に動いてたらタグ
tag @a[scores={z=1..}] add z_move
#z方向に動いてたらタグ
tag @a[scores={z=..-1}] add z_move
#Y動いてたらtag
tag @a[scores={y=..-1}] add y_move
tag @a[scores={y=1..}] add y_move
tag @a[tag=x_move] add moves
tag @a[tag=z_move] add moves
tag @a[scores={x=0}] remove x_move
tag @a[scores={y=0}] remove y_move
tag @a[scores={z=0}] remove z_move
tag @a[tag=!x_move,tag=!z_move] remove moves
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#イカ表示
replaceitem entity @a[hasitem={item=spl:Squid_armor,location=slot.weapon.offhand},tag=!sneaking] slot.weapon.offhand 0 air
#エフェクト
effect @a[tag=!sneaking,tag=!brush_p] speed 0 255 true
effect @a[tag=!sneaking] jump_boost 0 255 true
effect @a[tag=!sneaking] jump_boost 1 1 true
#インク回復 
scoreboard  players add @a[scores={ink=..10000,ink_lock=..0},tag=!sneaking] ink 50
scoreboard players add @a[scores={ink_lock=1..}] ink_lock -1
scoreboard players set @a[scores={ink=10000..}] ink 10000
#壁
execute as @a[tag=!sneaking] at @s positioned ~~0.2~ rotated ~ 0 unless block ^^^0.5 spl:ink_block_orange run effect @s levitation 0 255 true
#体力回復
execute as @a[tag=!sneaking,scores={heel_cool=..0}] at @s unless block ~~-0.1~ spl:ink_block_orange unless block ~~-0.1~ spl:ink_block_black_slab run effect @s regeneration 1 3 true
#敵インク処理
execute as @a at @s if block ~~-0.9~ spl:ink_block_darkgreen run effect @s slowness 1 2 true 
#execute as @a at @s unless block ~~-0.9~ spl:ink_block_darkgreen run effect @s slowness 0 3 true
execute as @a[scores={damage_cool=..0}] at @s if block ~~-0.9~ spl:ink_block_darkgreen run damage @s 1 
execute as @a[scores={damage_cool=..4}] at @s unless block ~~-0.9~ spl:ink_block_darkgreen run scoreboard players set @s damage_cool 5
#スコアへらし
scoreboard players remove @a[scores={heel_cool=1..}]  heel_cool 1
scoreboard players remove @a[scores={damage_cool=1..}]  damage_cool 1
#■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
#スニークしてたら実行
execute if entity @a[tag=sneaking] run function Inks/Squid_controller_sneaking
