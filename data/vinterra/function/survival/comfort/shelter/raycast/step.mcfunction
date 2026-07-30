# vinterra:survival/comfort/shelter/raycast/step
# Advances one half-block step along the current shelter ray
# @s remains the player

# First-pass block evaluation:
# static passable blocks transmit the ray fully; all other blocks stop it
#
# Future state-sensitive and partial-transmission checks belong immediately
# before this generic fallback.
execute unless block ~ ~ ~ #vinterra:shelter_passable run return 0

# Reaching the distance limit through transmissive blocks means exterior exposure
scoreboard players add #shelter_ray_steps vin.comfort_tmp 1
execute if score #shelter_ray_steps vin.comfort_tmp >= #shelter_ray_step_limit vin.comfort_meta run return run function vinterra:survival/comfort/shelter/raycast/escape

# Continue along the current direction
return run execute positioned ^ ^ ^0.5 run function vinterra:survival/comfort/shelter/raycast/step