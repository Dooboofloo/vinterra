# vinterra:feedback/hint/update
# Renders and advances one active hint
# Must be executed as the player

execute if score @s vin.hint_id matches 1 run function vinterra:feedback/hint/render/cold
execute if score @s vin.hint_id matches 2 run function vinterra:feedback/hint/render/wetness
execute if score @s vin.hint_id matches 3 run function vinterra:feedback/hint/render/cold_exposure

scoreboard players operation @s vin.hint_timer -= #feedback_interval vin.feedback_meta
execute if score @s vin.hint_timer matches ..0 run function vinterra:feedback/hint/clear

return 1
