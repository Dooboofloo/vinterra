# vinterra:survival/comfort/shelter/cleanup
# Removes all temporary shelter-search entities

execute at @e[type=marker,tag=vin.shelter_node] align xyz positioned ~0.5 ~0.5 ~0.5 run particle soul_fire_flame ~ ~ ~ 0 0 0 0 1 force

kill @e[type=marker,tag=vin.shelter_node]
kill @e[type=marker,tag=vin.shelter_candidate]

return 1