# vinterra:survival/warmth/block/recalc_positioned
# Recalculates all block-based warmth components for the executing player
# Executed by vinterra:survival/warmth/block/recalc after it determines the proper origin

# Calculate Block Heat Contribution and scale it according to Comfort
function vinterra:survival/warmth/block/heat/recalc
function vinterra:survival/warmth/block/heat/apply_comfort

# Calculate Block Cold Contribution
function vinterra:survival/warmth/block/cold/recalc

scoreboard players operation @s vin.warmth_block = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_block -= @s vin.block_cold_total