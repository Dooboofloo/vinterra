# vinterra:survival/comfort/shelter/recalc
# Determines whether the player's coverage ceiling forms a locally contained overhead basin
# Must be executed as and at the player
# The survival scheduler guarantees only one active player recalculation
#
# Coverage must run immediately before this function.

# Remove stale shelter-search state and default to unsheltered
function vinterra:survival/comfort/shelter/cleanup
tag @s remove vin.player_sheltered

# Initialize shared shelter-search state
scoreboard players set #shelter_leak vin.comfort_tmp 0
scoreboard players set #shelter_nodes vin.comfort_tmp 0
scoreboard players set #shelter_candidate_depth vin.comfort_tmp 0

# Without direct coverage, there is no ceiling basin to search
execute unless entity @s[tag=vin.player_covered] run return run function vinterra:survival/comfort/shelter/fail

# Defensive guard: successful coverage must provide its ceiling marker
execute unless entity @e[type=marker,tag=vin.coverage_ceiling,limit=1] run return run function vinterra:survival/comfort/shelter/fail

# A distant roof still blocks precipitation but does not provide meaningful thermal shelter
execute if score #coverage_rise vin.comfort_tmp > #shelter_ceiling_limit vin.comfort_meta run return run function vinterra:survival/comfort/shelter/fail

# Adopt the coverage ceiling as the depth-zero shelter node
scoreboard players set @e[type=marker,tag=vin.coverage_ceiling,limit=1] vin.shelter_depth 0
tag @e[type=marker,tag=vin.coverage_ceiling,limit=1] add vin.shelter_node
tag @e[type=marker,tag=vin.coverage_ceiling,limit=1] add vin.shelter_frontier
tag @e[type=marker,tag=vin.coverage_ceiling,limit=1] remove vin.coverage_ceiling
scoreboard players set #shelter_nodes vin.comfort_tmp 1

# Search outward from the coverage ceiling
function vinterra:survival/comfort/shelter/search/select_next

# Any discovered route out of the ceiling basin means the player is unsheltered
execute if score #shelter_leak vin.comfort_tmp matches 1 run return run function vinterra:survival/comfort/shelter/fail

# No local route out of the basin was found
return run function vinterra:survival/comfort/shelter/succeed