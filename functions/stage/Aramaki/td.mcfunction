execute if score "$time_check" stage_change matches 100 run tellraw @a { "rawtext": [{"text":"アラマキ砦を満潮状態に変更します"}] }
#fill
execute if score "$time_check" stage_change matches 0 run fill -63 28 62 126 28 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 16 run fill -63 29 62 126 29 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 30 run fill -63 30 62 126 30 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 44 run fill -63 31 62 126 31 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 58 run fill -63 32 62 126 32 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 72 run fill -63 33 62 126 33 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 86 run fill -63 34 62 126 34 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 87..99 run fill -63 35 62 126 35 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 87..99 run fill -63 36 62 126 36 -34 air 0 replace spl:face_water
 
 execute if score "$time_check" stage_change matches 0 run fill -63 28 -127 126 28 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 16 run fill -63 29 -127 126 29 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 30 run fill -63 30 -127 126 30 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 44 run fill -63 31 -127 126 31 -34 spl:face_water 0 keep
 execute if score "$time_check" stage_change matches 58 run fill -63 32 -127 126 32 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 72 run fill -63 33 -127 126 33 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 86 run fill -63 34 -127 126 34 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 87..99 run fill -63 35 -127 126 35 -34 air 0 replace spl:face_water
 execute if score "$time_check" stage_change matches 87..99 run fill -63 36 -127 126 36 -34 air 0 replace spl:face_water
execute if score "$time_check" stage_change matches 1 run tellraw @a { "rawtext": [{"text":"変更完了しました"}] }
