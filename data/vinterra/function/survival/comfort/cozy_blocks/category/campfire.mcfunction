# vinterra:survival/comfort/cozy_blocks/category/campfire
# Performs block state checks and add comfort.
# Must be executed at a block of the correct category.

## Guard clause
execute if score #accumulated_campfire vin.comfort_tmp >= #campfire_max vin.comfort_meta run return 0 

## Block state checks
# Consider only lit campfires
execute if block ~ ~ ~ minecraft:campfire[lit=false] run return 0

## Contribute comfort accumulation and clamped
scoreboard players operation #accumulated_campfire vin.comfort_tmp += #campfire_comfort vin.comfort_meta
execute if score #accumulated_campfire vin.comfort_tmp > #campfire_max vin.comfort_meta run scoreboard players operation #accumulated_campfire vin.comfort_tmp = #campfire_max vin.comfort_meta

return 1