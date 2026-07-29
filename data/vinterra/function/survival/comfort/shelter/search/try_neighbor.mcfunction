# vinterra:survival/comfort/shelter/search/try_neighbor
# Attempts to add the block at the current position to the connected shelter volume
# Must be executed as the player at the neighboring block position

# Non-passable blocks bound the connected volume
execute unless block ~ ~ ~ #vinterra:shelter_volume_passable run return 0

# Ignore cells that have already been discovered
execute if entity @e[type=marker,tag=vin.shelter_node,distance=..0.1,limit=1] run return 0

# A newly discovered cell beyond the volume limit means this space is not sheltered
execute if score #shelter_nodes vin.comfort_tmp >= #shelter_volume_limit vin.comfort_meta run scoreboard players set #shelter_overflow vin.comfort_tmp 1
execute if score #shelter_overflow vin.comfort_tmp matches 1 run return 0

# Commit the newly discovered cell
summon marker ~ ~ ~ {Tags:["vin.shelter_node","vin.shelter_frontier"]}
scoreboard players add #shelter_nodes vin.comfort_tmp 1

return 1