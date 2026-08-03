# vinterra:feedback/hint/start/cold
# Starts the one-time basic cold hint
# Must be executed as the player

advancement grant @s only vinterra:feedback/hint_seen/cold

scoreboard players set @s vin.hint_id 1
scoreboard players operation @s vin.hint_timer = #hint_duration vin.feedback_meta

return run function vinterra:feedback/hint/render/cold
