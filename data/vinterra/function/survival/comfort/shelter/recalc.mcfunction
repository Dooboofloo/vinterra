# vinterra:survival/comfort/shelter/recalc
# Calculates player-local environmental isolation using directional raycasts
# Must be executed as and at the player
# The survival scheduler guarantees only one active player recalculation

# Default to fully exposed
scoreboard players set @s vin.shelter 0

# Direct precipitation exposure guarantees that the player is not sheltered
execute unless entity @s[tag=vin.player_covered] run return 0

# Begin fully sheltered; each ray that reaches the exterior removes exposure weight
scoreboard players operation @s vin.shelter = #shelter_max vin.comfort_meta

function vinterra:survival/comfort/shelter/raycast/cast_all

# Defensive clamp
execute if score @s vin.shelter matches ..-1 run scoreboard players set @s vin.shelter 0
execute if score @s vin.shelter > #shelter_max vin.comfort_meta run scoreboard players operation @s vin.shelter = #shelter_max vin.comfort_meta

return 1