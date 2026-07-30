# vinterra:survival/comfort/shelter/raycast/escape
# Removes the escaped portion of the current ray's weight from shelter
# Must be executed as the player

# exposure = weight × remaining transmission / maximum transmission
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp = #shelter_ray_weight vin.comfort_tmp
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp *= #shelter_ray_transmission vin.comfort_tmp
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp /= #shelter_transmission_max vin.comfort_meta

scoreboard players operation @s vin.shelter -= #shelter_ray_exposure vin.comfort_tmp

return 1