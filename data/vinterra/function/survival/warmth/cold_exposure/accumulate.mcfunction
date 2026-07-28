# vinterra:survival/warmth/cold_exposure/accumulate
# Increases exposure toward the current cold band's equilibrium
# Must be executed as the player
# vin.warmth_tmp contains the equilibrium target

execute if score @s vin.warmth_band matches -1 run scoreboard players operation @s vin.cold_exposure += #exposure_gain_cold vin.warmth_meta
execute if score @s vin.warmth_band matches -2 run scoreboard players operation @s vin.cold_exposure += #exposure_gain_frigid vin.warmth_meta
execute if score @s vin.warmth_band matches -3 run scoreboard players operation @s vin.cold_exposure += #exposure_gain_freezing vin.warmth_meta

# Do not move past the current equilibrium
execute if score @s vin.cold_exposure > @s vin.warmth_tmp run scoreboard players operation @s vin.cold_exposure = @s vin.warmth_tmp

return run function vinterra:survival/warmth/cold_exposure/update_stage