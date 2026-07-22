# vinterra:survival/warmth/block/heat/raycast/select_next
# Selects the next unprocessed probe by priority, then distance
# Must be executed as and at the player

# Stop once the raycast budget has been exhausted
execute if score #raycasts vin.warmth_tmp >= #raycast_limit vin.warmth_meta run return 1

# Ensure there is no stale current probe
function vinterra:survival/warmth/block/heat/raycast/cleanup

# First priority
tag @e[type=marker,tag=vin.heat_probe,tag=vin.heat_p1,tag=!vin.heat_probe_processed,sort=nearest,limit=1] add vin.heat_probe_current

# Second priority, only if no P1 probe was available
execute unless entity @e[type=marker,tag=vin.heat_probe_current,limit=1] run tag @e[type=marker,tag=vin.heat_probe,tag=vin.heat_p2,tag=!vin.heat_probe_processed,sort=nearest,limit=1] add vin.heat_probe_current

# Third priority, only if no P1 or P2 probe was available
execute unless entity @e[type=marker,tag=vin.heat_probe_current,limit=1] run tag @e[type=marker,tag=vin.heat_probe,tag=vin.heat_p3,tag=!vin.heat_probe_processed,sort=nearest,limit=1] add vin.heat_probe_current

# No probes remain
execute unless entity @e[type=marker,tag=vin.heat_probe_current,limit=1] run return 1

# Test the selected probe
scoreboard players add #raycasts vin.warmth_tmp 1
scoreboard players set #ray_steps vin.warmth_tmp 0

function vinterra:survival/warmth/block/heat/raycast/cast_current

# Continue until no candidates remain or the budget is exhausted
return run function vinterra:survival/warmth/block/heat/raycast/select_next