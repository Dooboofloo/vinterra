# vinterra:survival/warmth/block/heat/raycast/step
# Advances one step along the current heat ray

# The probe has been reached
execute if entity @e[type=marker,tag=vin.heat_probe_current,distance=..0.2,sort=nearest,limit=1] run return run function vinterra:survival/warmth/block/heat/raycast/succeed

# Stop when entering a thermally blocking block.
# Heat landmarks are exempt so the ray can enter the target source block.
execute unless block ~ ~ ~ #vinterra:heat_raycast_passable unless block ~ ~ ~ #vinterra:heat_landmark run return run function vinterra:survival/warmth/block/heat/raycast/fail

# Safety limit
scoreboard players add #ray_steps vin.heat_tmp 1
execute if score #ray_steps vin.heat_tmp >= #ray_step_limit vin.heat_meta run return run function vinterra:survival/warmth/block/heat/raycast/fail

# Advance one step
return run execute positioned ^ ^ ^0.1 run function vinterra:survival/warmth/block/heat/raycast/step