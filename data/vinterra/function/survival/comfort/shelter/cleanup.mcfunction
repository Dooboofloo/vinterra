# vinterra:survival/comfort/shelter/cleanup
# Removes all temporary shelter-volume search entities
# The survival scheduler guarantees only one active player recalculation

# Debug
kill @e[type=block_display,tag=vin.test]
execute if entity @s[tag=vin.debug_viewer] at @e[type=marker,tag=vin.shelter_node] align xyz positioned ~0.5 ~0.5 ~0.5 run summon block_display ~-0.125 ~-0.125 ~-0.125 {NoGravity:1b,Glowing:1b,Tags:["vin.test"],glow_color_override:3847130,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:soul_lantern"}}

kill @e[type=marker,tag=vin.shelter_node]

return 1