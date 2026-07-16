# vinterra:survival/warmth/block/heat/raycast/cast_current
# Casts from the player's torso toward the current probe
# Must be executed as and at the player

execute unless entity @e[type=marker,tag=vin.heat_probe_current,sort=nearest,limit=1] run return 0

return run execute at @s positioned ~ ~1.0 ~ facing entity @e[type=marker,tag=vin.heat_probe_current,sort=nearest,limit=1] feet positioned ^ ^ ^0.125 run function vinterra:survival/warmth/block/heat/raycast/step