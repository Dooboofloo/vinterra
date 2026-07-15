# vinterra:survival/warmth/block/heat/raycast/begin
# Initializes and runs line of sight tests for discovered heat probes
# Must be executed as and at the player

# Reset runtime counters
scoreboard players set #raycasts vin.heat_tmp 0
scoreboard players set #visible vin.heat_tmp 0
scoreboard players set #ray_steps vin.heat_tmp 0

# Reset lifecycle state, allowing this stage to be rerun for testing
function vinterra:survival/warmth/block/heat/raycast/cleanup
tag @e[type=marker,tag=vin.heat_probe] remove vin.heat_probe_processed
tag @e[type=marker,tag=vin.heat_probe] remove vin.heat_probe_visible
tag @e[type=marker,tag=vin.heat_probe] remove vin.heat_probe_blocked

# Process probes
function vinterra:survival/warmth/block/heat/raycast/select_next

# Defensive cleanup
function vinterra:survival/warmth/block/heat/raycast/cleanup

return 1