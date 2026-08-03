# vinterra:feedback/hint/start/cold_exposure
# Starts the one-time Cold Exposure hint
# Must be executed as the player

advancement grant @s only vinterra:feedback/hint_seen/cold_exposure

scoreboard players set @s vin.hint_id 3
scoreboard players operation @s vin.hint_timer = #hint_duration vin.feedback_meta

return run function vinterra:feedback/hint/render/cold_exposure
