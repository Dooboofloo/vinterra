# vinterra:survival/comfort/cozy_blocks/category/bedding
# Performs block state checks and add comfort.
# Must be executed at a block of the correct category.

## Guard clause
execute if score #accumulated_bedding vin.comfort_tmp >= #bedding_max vin.comfort_meta run return 0 

## Block state checks
# Only consider the foot of the bed so as to not double-count beds
# We used to consider only the heads, but it is more common for
# the foot of the bed to extend into a space
execute if block ~ ~ ~ #minecraft:beds[part=head] run return 0

## Contribute comfort accumulation and clamped
scoreboard players operation #accumulated_bedding vin.comfort_tmp += #bedding_comfort vin.comfort_meta
execute if score #accumulated_bedding vin.comfort_tmp > #bedding_max vin.comfort_meta run scoreboard players operation #accumulated_bedding vin.comfort_tmp = #bedding_max vin.comfort_meta

return 1