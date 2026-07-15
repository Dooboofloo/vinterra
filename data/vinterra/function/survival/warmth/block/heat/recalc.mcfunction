# vinterra:survival/warmth/block/heat/recalc
# Calculates landmark heat visibility for the executing player
# Must be executed as and at the player

# TODO: Prevent false positives from raycast stepping through corner occlusions

function vinterra:survival/warmth/block/heat/discover
function vinterra:survival/warmth/block/heat/raycast/begin

# Testing
# tellraw @p ["",{text:"Succeeded: ",color:"green"},{score:{name:"#visible",objective:"vin.heat_tmp"},color:"green"}]
execute at @e[type=marker,tag=vin.heat_probe,tag=vin.heat_probe_visible] run setblock ~ ~ ~ minecraft:lime_wool
execute at @e[type=marker,tag=vin.heat_probe,tag=vin.heat_probe_blocked] run setblock ~ ~ ~ minecraft:red_wool