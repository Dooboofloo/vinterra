# vinterra:survival/comfort/shelter/search/select_next
# Selects and processes one remaining shelter-volume frontier node
# Traversal order does not affect the final bounded-volume result
# Must be executed as the player

# Stop immediately after exceeding the permitted volume
execute if score #shelter_overflow vin.comfort_tmp matches 1 run return 0

# Clear stale selection state
tag @e[type=marker,tag=vin.shelter_current] remove vin.shelter_current

# No frontier remains, so the complete connected volume was bounded
execute unless entity @e[type=marker,tag=vin.shelter_frontier,limit=1] run return 1

# Select exactly one unprocessed node
tag @e[type=marker,tag=vin.shelter_frontier,sort=arbitrary,limit=1] add vin.shelter_current

# Defensive guard
execute unless entity @e[type=marker,tag=vin.shelter_current,limit=1] run return 0

# Consume the selected frontier node
tag @e[type=marker,tag=vin.shelter_current,limit=1] remove vin.shelter_frontier
tag @e[type=marker,tag=vin.shelter_current,limit=1] add vin.shelter_processed

# Discover its six cardinal neighbors
function vinterra:survival/comfort/shelter/search/expand_current

# Clear transient selection state
tag @e[type=marker,tag=vin.shelter_current] remove vin.shelter_current

return run function vinterra:survival/comfort/shelter/search/select_next