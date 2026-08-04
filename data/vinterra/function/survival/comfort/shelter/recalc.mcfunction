# vinterra:survival/comfort/shelter/recalc
# Calculates player-local environmental isolation using directional raycasts
# Must be executed as and at the player
# The survival scheduler guarantees only one active player recalculation

# Thermal raycasts intentionally allow corner-grazing paths
# This approximates heat transfer through imperfect structural seams and keeps
# environmental exposure and block heat behavior consistent.
# Just add corner blocks to your bases if you're worried about it!

# Debug
kill @e[type=block_display,tag=vin.shelter_debug]

# Clean up any remnants from an interrupted calculation
kill @e[type=marker,tag=vin.shelter_cell]

# Begin fully exposed; each ray adds its sheltered contribution
scoreboard players set @s vin.shelter 0

# Direct precipitation exposure guarantees that the player is not sheltered
execute unless entity @s[tag=vin.player_covered] run return 0

function vinterra:survival/comfort/shelter/raycast/cast_all

# Defensive clamp
execute if score @s vin.shelter matches ..-1 run scoreboard players set @s vin.shelter 0
execute if score @s vin.shelter > #shelter_max vin.comfort_meta run scoreboard players operation @s vin.shelter = #shelter_max vin.comfort_meta

return 1