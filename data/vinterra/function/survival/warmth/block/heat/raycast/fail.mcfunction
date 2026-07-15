# vinterra:survival/warmth/block/heat/raycast/fail
# Marks the current heat probe as blocked or otherwise unreachable
# @s remains the player, although the execution position is currently along the ray

execute at @s run tag @e[type=marker,tag=vin.heat_probe_current,sort=nearest,limit=1] add vin.heat_probe_blocked
execute at @s run tag @e[type=marker,tag=vin.heat_probe_current,sort=nearest,limit=1] add vin.heat_probe_processed

# Remove the transient current tag from every probe defensively
function vinterra:survival/warmth/block/heat/raycast/cleanup

return 0