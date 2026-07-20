# vinterra:survival/warmth/block/recalc_positioned
# Recalculates all block-based warmth components for the executing player
# Executed by vinterra:survival/warmth/block/recalc after it determines the proper origin

function vinterra:survival/warmth/block/heat/recalc
function vinterra:survival/warmth/block/cold/recalc

scoreboard players operation @s vin.warmth_block_contribution = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_block_contribution -= @s vin.block_cold_total