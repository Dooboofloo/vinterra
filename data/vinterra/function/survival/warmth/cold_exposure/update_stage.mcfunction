# vinterra:survival/warmth/cold_exposure/update_stage
# Updates the player's cold stage
# Must be executed as the player

# Initialize missing exposure
execute unless score @s vin.cold_exposure matches -2147483648..2147483647 run scoreboard players set @s vin.cold_exposure 0

# Clamp corrupted exposure
execute if score @s vin.cold_exposure matches ..-1 run scoreboard players set @s vin.cold_exposure 0
execute if score @s vin.cold_exposure > #exposure_target_freezing vin.warmth_meta run scoreboard players operation @s vin.cold_exposure = #exposure_target_freezing vin.warmth_meta

# Classify current exposure
scoreboard players set @s vin.warmth_tmp 0

execute if score @s vin.cold_exposure >= #exposure_stage_1_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 1
execute if score @s vin.cold_exposure >= #exposure_stage_2_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 2
execute if score @s vin.cold_exposure >= #exposure_stage_3_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 3

# No stage transition
execute if score @s vin.cold_stage = @s vin.warmth_tmp run return 0

return run function vinterra:survival/warmth/cold_exposure/apply_stage