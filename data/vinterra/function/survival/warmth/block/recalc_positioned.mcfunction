# vinterra:survival/warmth/block/recalc_positioned
# Recalculates all block-based warmth components for the executing player
# Executed by vinterra:survival/warmth/block/recalc after it determines the proper origin

function vinterra:survival/warmth/block/heat/recalc
function vinterra:survival/warmth/block/cold/recalc

# Debug only
# summon armor_stand ~ ~ ~ {NoGravity:1b,Small:1b,Glowing:1b,Tags:["vin.test"]}

# Debug outputs
# tellraw @s ["",{text:"Block Heat Total: ",color:"green"},{score:{name:"@s",objective:"vin.block_heat_total"},color:"green"}]
# tellraw @s ["",{"text":"Block Cold Total: ","color":"aqua"},{"score":{"name":"@s","objective":"vin.block_cold_total"},"color":"aqua"},{"text":" (Raw ","color":"gray"},{"score":{"name":"@s","objective":"vin.block_cold_raw"},"color":"gray"},{"text":")","color":"gray"}]
# tellraw @s ["",{"text":"Block Warmth Total: ","color":"gold"},{"score":{"name":"@s","objective":"vin.warmth_block_contribution"},"color":"gold"}]
# tellraw @s ""

# TODO: Comfort modifies block_heat_total contribution here (planned 0-3: +0%, 4-7: +25%, 8-11: +50%, 12-15: +75%, 16: +100%)

scoreboard players operation @s vin.warmth_block_contribution = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_block_contribution -= @s vin.block_cold_total