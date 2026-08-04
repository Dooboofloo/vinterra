# vinterra:survival/comfort/shelter/raycast/evaluate_block
# Adds the current block's shelter contribution to the active ray
# Must be executed as the player inside the evaluated block cell

# Debug
execute if entity @s[tag=vin.debug_visualizer] if block ~ ~ ~ #minecraft:slabs[type=double] run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:65280,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625,-0.0625,-0.0625],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:green_concrete"}}
execute if entity @s[tag=vin.debug_visualizer] if block ~ ~ ~ #vinterra:shelter/three_quarters run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:15073024,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625,-0.0625,-0.0625],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:yellow_concrete"}}
execute if entity @s[tag=vin.debug_visualizer] if block ~ ~ ~ #vinterra:shelter/half unless block ~ ~ ~ #minecraft:slabs[type=double] run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:16756224,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625,-0.0625,-0.0625],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:orange_concrete"}}
execute if entity @s[tag=vin.debug_visualizer] if block ~ ~ ~ #vinterra:shelter/quarter run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:16720384,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625,-0.0625,-0.0625],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:red_concrete"}}

# Double slabs are full blocks despite also matching the half-shelter slab tag
execute if block ~ ~ ~ #minecraft:slabs[type=double] run return run function vinterra:survival/comfort/shelter/raycast/add_blocking_macro {amount:16}

# Coarse partial-shelter categories
execute if block ~ ~ ~ #vinterra:shelter/three_quarters run return run function vinterra:survival/comfort/shelter/raycast/add_blocking_macro {amount:12}
execute if block ~ ~ ~ #vinterra:shelter/half run return run function vinterra:survival/comfort/shelter/raycast/add_blocking_macro {amount:8}
execute if block ~ ~ ~ #vinterra:shelter/quarter run return run function vinterra:survival/comfort/shelter/raycast/add_blocking_macro {amount:4}

# Any other non-passable block provides full shelter
execute if entity @s[tag=vin.debug_visualizer] unless block ~ ~ ~ #vinterra:shelter/passable run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:65280,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.0625,-0.0625,-0.0625],scale:[0.125f,0.125f,0.125f]},block_state:{Name:"minecraft:green_concrete"}}
execute unless block ~ ~ ~ #vinterra:shelter/passable run return run function vinterra:survival/comfort/shelter/raycast/add_blocking_macro {amount:16}

return 0