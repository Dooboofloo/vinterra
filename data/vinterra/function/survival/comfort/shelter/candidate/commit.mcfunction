# vinterra:survival/comfort/shelter/candidate/commit
# Converts the normalized candidate into a BFS frontier node
# Must be executed as the player

# Defensive guard
execute unless entity @e[type=marker,tag=vin.shelter_candidate,limit=1] run return 0

# Discard a candidate that normalized to an already-discovered block
execute at @e[type=marker,tag=vin.shelter_candidate,limit=1] if entity @e[type=marker,tag=vin.shelter_node,distance=..0.1,limit=1] run kill @e[type=marker,tag=vin.shelter_candidate,sort=nearest,limit=1]
execute unless entity @e[type=marker,tag=vin.shelter_candidate,limit=1] run return 0

# Stop adding nodes when the safety budget is exhausted
execute if score #shelter_nodes vin.comfort_tmp >= #shelter_node_limit vin.comfort_meta run kill @e[type=marker,tag=vin.shelter_candidate]
execute unless entity @e[type=marker,tag=vin.shelter_candidate,limit=1] run return 0

# Commit the candidate
tag @e[type=marker,tag=vin.shelter_candidate,limit=1] add vin.shelter_node
tag @e[type=marker,tag=vin.shelter_candidate,limit=1] add vin.shelter_frontier
tag @e[type=marker,tag=vin.shelter_candidate,limit=1] remove vin.shelter_candidate

scoreboard players add #shelter_nodes vin.comfort_tmp 1

return 1