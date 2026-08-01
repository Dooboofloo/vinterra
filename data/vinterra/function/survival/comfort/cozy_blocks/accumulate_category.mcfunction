# vinterra:survival/comfort/cozy_blocks/accumulate_category
# Dispatches an accumulating block to its correct category
# Must be executed at a block in #vinterra:cozy_block

# Debug
execute if entity @a[tag=vin.debug_visualizer] align xyz positioned ~0.5 ~0.5 ~0.5 run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.comfort_debug"],glow_color_override:16758528,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625f,-0.0625f,-0.0625f],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:orange_wool"}}

execute if block ~ ~ ~ #vinterra:cozy_blocks/campfire run return run function vinterra:survival/comfort/cozy_blocks/category/campfire
execute if block ~ ~ ~ #vinterra:cozy_blocks/bedding run return run function vinterra:survival/comfort/cozy_blocks/category/bedding
execute if block ~ ~ ~ #vinterra:cozy_blocks/softness run return run function vinterra:survival/comfort/cozy_blocks/category/softness
execute if block ~ ~ ~ #vinterra:cozy_blocks/decoration run return run function vinterra:survival/comfort/cozy_blocks/category/decoration
execute if block ~ ~ ~ #vinterra:cozy_blocks/banner run return run function vinterra:survival/comfort/cozy_blocks/category/banner

return 0