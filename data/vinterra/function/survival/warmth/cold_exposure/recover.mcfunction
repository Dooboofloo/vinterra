# vinterra:survival/warmth/cold_exposure/recover
# Decreases exposure toward the current warmth band's equilibrium
# Must be executed as the player
# vin.warmth_tmp contains the equilibrium target

# Cold and Frigid can slowly relieve exposure above their own equilibrium
# Freezing cannot reach this function
execute if score @s vin.warmth_band matches ..-1 run scoreboard players operation @s vin.cold_exposure -= #exposure_recovery_cold vin.warmth_meta

# Safe bands recover increasingly quickly
execute if score @s vin.warmth_band matches 0 run scoreboard players operation @s vin.cold_exposure -= #exposure_recovery_warm vin.warmth_meta
execute if score @s vin.warmth_band matches 1 run scoreboard players operation @s vin.cold_exposure -= #exposure_recovery_hot vin.warmth_meta
execute if score @s vin.warmth_band matches 2 run scoreboard players operation @s vin.cold_exposure -= #exposure_recovery_scorching vin.warmth_meta
execute if score @s vin.warmth_band matches 3 run scoreboard players operation @s vin.cold_exposure -= #exposure_recovery_scalding vin.warmth_meta

# Do not recover past the current equilibrium
execute if score @s vin.cold_exposure < @s vin.warmth_tmp run scoreboard players operation @s vin.cold_exposure = @s vin.warmth_tmp

return run function vinterra:survival/warmth/cold_exposure/update_stage