# vinterra:survival/comfort/shelter/raycast/cast_macro
# Initializes and casts one shelter ray
# Macro arguments: yaw, pitch, and weight
# Must be executed as and at the player

$scoreboard players set #shelter_ray_weight vin.comfort_tmp $(weight)
scoreboard players operation #shelter_ray_transmission vin.comfort_tmp = #shelter_transmission_max vin.comfort_meta
scoreboard players set #shelter_ray_steps vin.comfort_tmp 0

$execute anchored eyes rotated $(yaw) $(pitch) positioned ^ ^ ^0.5 run function vinterra:survival/comfort/shelter/raycast/step

return 1