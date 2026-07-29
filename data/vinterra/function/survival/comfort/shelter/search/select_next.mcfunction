# vinterra:survival/comfort/shelter/search/select_next
# Selects and processes the shallowest remaining frontier node
# Must be executed as the player

# Stop immediately after finding a sky leak
execute if score #shelter_leak vin.comfort_tmp matches 1 run return 0

# Clear stale selection state
tag @e[type=marker,tag=vin.shelter_selectable] remove vin.shelter_selectable
tag @e[type=marker,tag=vin.shelter_current] remove vin.shelter_current

# No frontier remains, so no local sky route was found
execute unless entity @e[type=marker,tag=vin.shelter_frontier,limit=1] run return 1

# Find the minimum frontier depth
scoreboard players set #shelter_frontier_depth vin.comfort_tmp 2147483647
scoreboard players operation #shelter_frontier_depth vin.comfort_tmp < @e[type=marker,tag=vin.shelter_frontier] vin.shelter_depth

# Mark nodes at the minimum depth
execute as @e[type=marker,tag=vin.shelter_frontier] if score @s vin.shelter_depth = #shelter_frontier_depth vin.comfort_tmp run tag @s add vin.shelter_selectable

# Select exactly one of the shallowest nodes
tag @e[type=marker,tag=vin.shelter_selectable,sort=arbitrary,limit=1] add vin.shelter_current

# Defensive guard
execute unless entity @e[type=marker,tag=vin.shelter_current,limit=1] run return 0

# Consume the selected frontier node
tag @e[type=marker,tag=vin.shelter_current,limit=1] remove vin.shelter_frontier
tag @e[type=marker,tag=vin.shelter_current,limit=1] add vin.shelter_processed

# Nodes at the radius boundary are retained for deduplication but do not expand
execute unless score @e[type=marker,tag=vin.shelter_current,limit=1] vin.shelter_depth >= #shelter_radius vin.comfort_meta run function vinterra:survival/comfort/shelter/search/expand_current

# Clear transient selection state
tag @e[type=marker,tag=vin.shelter_selectable] remove vin.shelter_selectable
tag @e[type=marker,tag=vin.shelter_current] remove vin.shelter_current

return run function vinterra:survival/comfort/shelter/search/select_next