# vinterra:survival/comfort/cozy_blocks/category/banner
# Performs block state checks and add comfort.
# Must be executed at a block of the correct category.

## Guard clause
execute if score #accumulated_banner vin.comfort_tmp >= #banner_max vin.comfort_meta run return 0 

## Block state checks
# Ominous banners are not cozy.
execute if predicate vinterra:block/ominous_banner run return 0

## Contribute comfort accumulation and clamped
scoreboard players operation #accumulated_banner vin.comfort_tmp += #banner_comfort vin.comfort_meta
execute if score #accumulated_banner vin.comfort_tmp > #banner_max vin.comfort_meta run scoreboard players operation #accumulated_banner vin.comfort_tmp = #banner_max vin.comfort_meta

return 1