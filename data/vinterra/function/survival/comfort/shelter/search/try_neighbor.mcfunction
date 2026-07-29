# vinterra:survival/comfort/shelter/search/try_neighbor
# Attempts to flow horizontally into one neighboring ceiling basin
# Must be executed as the player at the neighboring block position

# Solid geometry blocks basin flow
execute unless block ~ ~ ~ #vinterra:shelter_flow_passable run return 0

# Every neighbor is one horizontal step farther from the origin
scoreboard players operation #shelter_candidate_depth vin.comfort_tmp = @e[type=marker,tag=vin.shelter_current,limit=1] vin.shelter_depth
scoreboard players add #shelter_candidate_depth vin.comfort_tmp 1

# Enter the neighboring column and rise toward its local ceiling
return run function vinterra:survival/comfort/shelter/candidate/spawn