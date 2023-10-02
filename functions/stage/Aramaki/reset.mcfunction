scoreboard objectives add Stage_ID dummy
scoreboard players add "$ID" Stage_ID 0
execute if score "$ID" Stage_ID matches 0 run tellraw @a { "rawtext": [{"text":"失敗しました"}] }
execute if score "$ID" Stage_ID matches 1 run tellraw @a { "rawtext": [{"text":"アラマキ砦にセットします"}] }
execute if score "$ID" Stage_ID matches 2 run tellraw @a { "rawtext": [{"text":"シェケナダムにセットします"}] }
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_1" -64 26 -128
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_2" 0 26 -128
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_3" 64 26 -128
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_4" -64 26 -64
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_5" 0 26 -64
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_6" 64 26 -64
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_7" -64 26 0
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_8" 0 26 0
execute if score "$ID" Stage_ID matches 1 run structure load "armk_ntd_9" 64 26 0

execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_1" -64 26 -128
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_2" 0 26 -128
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_3" 64 26 -128
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_4" -64 26 -64
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_5" 0 26 -64
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_6" 64 26 -64
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_7" -64 26 0
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_8" 0 26 0
execute if score "$ID" Stage_ID matches 2 run structure load "shkndm_td_9" 64 26 0
execute if score "$ID" Stage_ID matches 1.. run tellraw @a { "rawtext": [{"text":"リセット完了しました"}] }