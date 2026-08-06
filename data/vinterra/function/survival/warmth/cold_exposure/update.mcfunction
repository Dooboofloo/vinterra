# vinterra:survival/warmth/cold_exposure/update
# Moves cold exposure toward the target represented by the current warmth band
# Must be executed as the player

# Debug lock
execute if entity @s[tag=vin.test_lock_exposure] run return 0

# Handle missing or corrupted exposure state
execute unless score @s vin.cold_exposure matches -2147483648..2147483647 run scoreboard players set @s vin.cold_exposure 0

# Clamp corrupted exposure
execute if score @s vin.cold_exposure matches ..-1 run scoreboard players set @s vin.cold_exposure 0
execute if score @s vin.cold_exposure > #exposure_target_freezing vin.warmth_meta run scoreboard players operation @s vin.cold_exposure = #exposure_target_freezing vin.warmth_meta

# Safe bands all have an equilibrium of zero
scoreboard players operation @s vin.warmth_tmp = #exposure_target_safe vin.warmth_meta

# Moves cold exposure toward the equilibrium represented by the current warmth band
execute if score @s vin.warmth_band matches -1 run scoreboard players operation @s vin.warmth_tmp = #exposure_target_cold vin.warmth_meta
execute if score @s vin.warmth_band matches -2 run scoreboard players operation @s vin.warmth_tmp = #exposure_target_frigid vin.warmth_meta
execute if score @s vin.warmth_band matches -3 run scoreboard players operation @s vin.warmth_tmp = #exposure_target_freezing vin.warmth_meta

# Exposure is already at the current band's equilibrium
execute if score @s vin.cold_exposure = @s vin.warmth_tmp run return run function vinterra:survival/warmth/cold_exposure/update_stage

# Move upward or downward toward the equilibrium
execute if score @s vin.cold_exposure < @s vin.warmth_tmp run return run function vinterra:survival/warmth/cold_exposure/accumulate

return run function vinterra:survival/warmth/cold_exposure/recover