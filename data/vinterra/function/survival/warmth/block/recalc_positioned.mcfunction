# vinterra:survival/warmth/block/recalc_positioned
# Recalculates all block-based warmth components for the executing player
# Executed by vinterra:survival/warmth/block/recalc after it determines the proper origin

function vinterra:survival/warmth/block/heat/recalc
function vinterra:survival/warmth/block/cold/recalc

# Debug only
# summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Glowing:1b,Tags:["vin.test"]}

# TODO: Comfort modifies block_heat_total contribution here (planned 0-3: +0%, 4-7: +25%, 8-11: +50%, 12-15: +75%, 16: +100%)

scoreboard players operation @s vin.warmth_block = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_block -= @s vin.block_cold_total