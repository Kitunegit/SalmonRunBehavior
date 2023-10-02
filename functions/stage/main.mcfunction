
scoreboard objectives add stage_change dummy
#"$time_check"を毎tick減少させる。
execute if score "$time_check" stage_change matches 1.. run scoreboard players add "$time_check" stage_change -1
#チェンジが実行されたらチェンジプログラムを起動し続ける
execute if score "$ftd" stage_change matches 1.. run function stage/Aramaki/ftd
execute if score "$ntd" stage_change matches 1.. run function stage/Aramaki/ntd
execute if score "$td" stage_change matches 1.. run function stage/Aramaki/td
#"$time_change"が終わったらチェンジスコアを無くす
execute if score "$time_check" stage_change matches 0 run scoreboard players set "$ftd" stage_change 0
execute if score "$time_check" stage_change matches 0 run scoreboard players set "$td" stage_change 0
execute if score "$time_check" stage_change matches 0 run scoreboard players set "$ntd" stage_change 0
