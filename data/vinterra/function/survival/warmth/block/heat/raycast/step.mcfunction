# vinterra:survival/warmth/block/heat/raycast/step
# Advances one step along the current heat ray

# The probe has been reached
execute align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[type=marker,tag=vin.heat_probe_current,distance=..0.01,sort=nearest,limit=1] run return run function vinterra:survival/warmth/block/heat/raycast/succeed

# Stop when entering a thermally blocking block.

# First, check special cases (note: if a block CAN be passed through (even only sometimes), it should be defined in #vinterra:heat_raycast_passable)
# Slabs are exempt unless they're double slabs
execute if block ~ ~ ~ #minecraft:slabs[type=double] run return run function vinterra:survival/warmth/block/heat/raycast/fail

# Then check for any opaque block
execute unless block ~ ~ ~ #vinterra:heat_raycast_passable run return run function vinterra:survival/warmth/block/heat/raycast/fail

# Safety limit
scoreboard players add #ray_steps vin.warmth_tmp 1
execute if score #ray_steps vin.warmth_tmp >= #ray_step_limit vin.warmth_meta run return run function vinterra:survival/warmth/block/heat/raycast/fail

# Advance one step
return run execute positioned ^ ^ ^0.1 run function vinterra:survival/warmth/block/heat/raycast/step