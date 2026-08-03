# vinterra:feedback/hint/start/wetness
# Starts the one-time meaningful Wetness hint
# Must be executed as the player

advancement grant @s only vinterra:feedback/hint_seen/wetness

scoreboard players set @s vin.hint_id 2
scoreboard players operation @s vin.hint_timer = #hint_duration vin.feedback_meta

return run function vinterra:feedback/hint/render/wetness
