# vinterra:survival/comfort/shelter/raycast/add_blocking_macro
# Adds a block's shelter contribution to the active ray
# Macro argument: amount
# Must be executed as the player

$scoreboard players add #shelter_ray_blocking vin.comfort_tmp $(amount)

# Clamp this ray to its maximum shelter contribution
execute if score #shelter_ray_blocking vin.comfort_tmp > #shelter_ray_blocking_max vin.comfort_meta run scoreboard players operation #shelter_ray_blocking vin.comfort_tmp = #shelter_ray_blocking_max vin.comfort_meta

return 1