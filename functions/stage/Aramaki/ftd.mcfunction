execute if score "$time_check" stage_change matches 100 run tellraw @a { "rawtext": [{"text":"アラマキ砦を満潮状態に変更します"}] }
#fill
execute if score "$time_check" stage_change matches 100 run fill -63 28 62 126 28 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 86 run fill -63 29 62 126 29 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 72 run fill -63 30 62 126 30 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 58 run fill -63 31 62 126 31 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 44 run fill -63 32 62 126 32 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 30 run fill -63 33 62 126 33 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 16 run fill -63 34 62 126 34 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 0 run fill -63 35 62 126 35 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 0 run fill 35 36 3 28 36 -11 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 33 36 -12 27 36 -15 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 33 36 -16 26 36 -16 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 32 36 -17 26 36 -19 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 25 36 -18 25 36 -26 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 27 36 -25 27 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 28 36 -24 28 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 29 36 -23 29 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 30 36 -22 30 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 31 36 -21 31 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 24 36 -19 24 36 -26 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 23 36 -26 22 36 -20 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 21 36 -27 21 36 -21 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 20 36 -21 20 36 -28 spl:face_water 0 keep 
 execute if score "$time_check" stage_change matches 0 run fill 19 36 -28 12 36 -22 spl:face_water 0 keep 



 execute if score "$time_check" stage_change matches 100 run fill -63 28 -127 126 28 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 86 run fill -63 29 -127 126 29 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 72 run fill -63 30 -127 126 30 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 58 run fill -63 31 -127 126 31 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 44 run fill -63 32 -127 126 32 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 30 run fill -63 33 -127 126 33 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 16 run fill -63 34 -127 126 34 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 0 run fill -63 35 -127 126 35 -34 spl:face_water 0 keep
execute if score "$time_check" stage_change matches 1 run tellraw @a { "rawtext": [{"text":"変更完了しました"}] }