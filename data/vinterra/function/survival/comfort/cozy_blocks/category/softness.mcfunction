# vinterra:survival/comfort/cozy_blocks/category/softness
# Performs block state checks and add comfort.
# Must be executed at a block of the correct category.

## Guard clause
execute if score #accumulated_softness vin.comfort_tmp >= #softness_max vin.comfort_meta run return 0 

## Block state checks
# None

## Contribute comfort accumulation and clamped
scoreboard players operation #accumulated_softness vin.comfort_tmp += #softness_comfort vin.comfort_meta
execute if score #accumulated_softness vin.comfort_tmp > #softness_max vin.comfort_meta run scoreboard players operation #accumulated_softness vin.comfort_tmp = #softness_max vin.comfort_meta

return 1