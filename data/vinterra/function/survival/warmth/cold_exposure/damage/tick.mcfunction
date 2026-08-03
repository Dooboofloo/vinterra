# vinterra:survival/warmth/cold_exposure/damage/tick
# Manages player cold damage timers
# Must be executed as the player

# Leaving freezing band completely resets cold damage timer
execute unless score @s vin.cold_stage matches 3.. run return run scoreboard players set @s vin.cold_dmg_timer 0

# Leaving maximum exposure pauses the sustained-exposure timer
execute unless score @s vin.cold_exposure >= #exposure_target_freezing vin.warmth_meta run return run return 0

# Increment the timer
scoreboard players add @s vin.cold_dmg_timer 1

# Damage applicable players
execute if score @s vin.cold_dmg_timer >= #cold_dmg_interval vin.warmth_meta run function vinterra:survival/warmth/cold_exposure/damage/apply

return 1