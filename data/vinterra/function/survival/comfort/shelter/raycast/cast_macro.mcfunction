# vinterra:survival/comfort/shelter/raycast/cast_macro
# Initializes and casts one shelter ray
# Macro arguments: yaw, pitch, and weight
# Must be executed as and at the player

$scoreboard players set #shelter_ray_weight vin.comfort_tmp $(weight)
scoreboard players set #shelter_ray_blocking vin.comfort_tmp 0
scoreboard players set #shelter_ray_steps vin.comfort_tmp 0

# The marker tracks the last block cell evaluated by this ray
kill @e[type=marker,tag=vin.shelter_cell]

$execute anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~0.35 ~0.5 rotated $(yaw) $(pitch) positioned ^ ^ ^0.5 run function vinterra:survival/comfort/shelter/raycast/step

kill @e[type=marker,tag=vin.shelter_cell]

return 1