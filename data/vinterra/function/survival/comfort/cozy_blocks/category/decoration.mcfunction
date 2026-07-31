# vinterra:survival/comfort/cozy_blocks/category/decoration
# Performs block state checks and add comfort.
# Must be executed at a block of the correct category.

## Guard clause
execute if score #accumulated_decoration vin.comfort_tmp >= #decoration_max vin.comfort_meta run return 0 

## Block state checks
execute if block ~ ~ ~ #minecraft:candles[lit=false] run return 0
execute if block ~ ~ ~ #minecraft:candle_cakes[lit=false] run return 0

## Contribute comfort accumulation and clamped
scoreboard players operation #accumulated_decoration vin.comfort_tmp += #decoration_comfort vin.comfort_meta
execute if score #accumulated_decoration vin.comfort_tmp > #decoration_max vin.comfort_meta run scoreboard players operation #accumulated_decoration vin.comfort_tmp = #decoration_max vin.comfort_meta

return 1