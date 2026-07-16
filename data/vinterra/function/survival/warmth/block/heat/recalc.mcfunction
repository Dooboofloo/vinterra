# vinterra:survival/warmth/block/heat/recalc
# Calculates landmark heat visibility for the executing player
# Must be executed as and at the player

# TODO: Prevent false positives from raycast stepping through corner occlusions

function vinterra:survival/warmth/block/heat/discover
function vinterra:survival/warmth/block/heat/raycast/begin
function vinterra:survival/warmth/block/heat/classify/begin
function vinterra:survival/warmth/block/heat/aggregate/begin

# Probes are no longer needed
function vinterra:survival/warmth/block/heat/clear_probes

tellraw @s ["",{text:"Block Heat Total: ",color:"green"},{score:{name:"@s",objective:"vin.block_heat_total"},color:"green"}]