# vinterra:survival/comfort/shelter/recalc
# Determines whether the player occupies a bounded connected volume
# Must be executed as and at the player
# The survival scheduler guarantees only one active player recalculation

# Remove stale search state and default to fully exposed
function vinterra:survival/comfort/shelter/cleanup
scoreboard players set @s vin.shelter 0

# Direct exposure to precipitation guarantees that the player is not sheltered
execute unless entity @s[tag=vin.player_covered] run return 0

# Initialize shared search state
scoreboard players set #shelter_nodes vin.comfort_tmp 0
scoreboard players set #shelter_overflow vin.comfort_tmp 0

# The player's eye block must belong to the traversable volume
execute anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~0.5 ~0.5 unless block ~ ~ ~ #vinterra:shelter_volume_passable run return run function vinterra:survival/comfort/shelter/fail

# Create the initial visited frontier node in the player's eye block
execute anchored eyes positioned ^ ^ ^ align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["vin.shelter_node","vin.shelter_frontier"]}
scoreboard players set #shelter_nodes vin.comfort_tmp 1

# Traverse the complete connected passable volume or stop when it exceeds the limit
function vinterra:survival/comfort/shelter/search/select_next

# Discovery of any additional cell beyond the permitted volume means exposure
execute if score #shelter_overflow vin.comfort_tmp matches 1 run return run function vinterra:survival/comfort/shelter/fail

# Exhausting the frontier within the limit means the volume is bounded
return run function vinterra:survival/comfort/shelter/succeed