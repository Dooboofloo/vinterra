# vinterra:survival/warmth/block/recalc
# Recalculates all block-based warmth components for the executing player
# Must be executed as and at the player

function vinterra:survival/warmth/block/heat/recalc
function vinterra:survival/warmth/block/cold/recalc

scoreboard players operation @s vin.warmth_block_contribution = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_block_contribution -= @s vin.block_cold_total