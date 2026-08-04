# vinterra:survival/comfort/shelter/raycast/step
# Advances one half-block step along the current shelter ray
# @s remains the player

# Evaluate this block only when the ray enters a new block cell
execute align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,tag=vin.shelter_cell,distance=..0.01,limit=1] run function vinterra:survival/comfort/shelter/raycast/enter_cell

# A fully obstructed ray cannot gain any more shelter
execute if score #shelter_ray_blocking vin.comfort_tmp >= #shelter_ray_blocking_max vin.comfort_meta run return run function vinterra:survival/comfort/shelter/raycast/finalize

# Advance through the ray's eight-block range
scoreboard players add #shelter_ray_steps vin.comfort_tmp 1
execute if score #shelter_ray_steps vin.comfort_tmp >= #shelter_ray_step_limit vin.comfort_meta run return run function vinterra:survival/comfort/shelter/raycast/finalize

return run execute positioned ^ ^ ^0.5 run function vinterra:survival/comfort/shelter/raycast/step