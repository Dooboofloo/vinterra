# vinterra:survival/warmth/block/heat/raycast/succeed
# Marks the current heat probe as visible
# @s remains the player, although the execution position is currently along the ray

tag @e[type=marker,tag=vin.heat_probe_current,distance=..0.2,sort=nearest,limit=1] add vin.heat_probe_visible
tag @e[type=marker,tag=vin.heat_probe_current,distance=..0.2,sort=nearest,limit=1] add vin.heat_probe_processed

scoreboard players add #visible vin.heat_tmp 1

# Remove the transient current tag from every probe defensively
function vinterra:survival/warmth/block/heat/raycast/cleanup

return 1