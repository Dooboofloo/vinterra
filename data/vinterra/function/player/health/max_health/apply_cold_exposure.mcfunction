# vinterra:player/health/max_health/apply_cold_exposure
# Synchronizes the cold-exposure max-health modifier with vin.cold_stage
# Must be executed as the player

# Remove the previous stage's modifier
attribute @s minecraft:max_health modifier remove vinterra:cold_exposure

# Apply the current stage
execute if score @s vin.cold_stage matches 1 run attribute @s minecraft:max_health modifier add vinterra:cold_exposure -4 add_value
execute if score @s vin.cold_stage matches 2 run attribute @s minecraft:max_health modifier add vinterra:cold_exposure -8 add_value
execute if score @s vin.cold_stage matches 3 run attribute @s minecraft:max_health modifier add vinterra:cold_exposure -12 add_value

return 1