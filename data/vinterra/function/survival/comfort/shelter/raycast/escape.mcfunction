# vinterra:survival/comfort/shelter/raycast/escape
# Removes the escaped portion of the current ray's weight from shelter
# Must be executed as the player

# Debug
execute if entity @s[tag=vin.debug_visualizer] run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:16711680,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.125f,-0.125f,-0.125f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:lantern"}}

# exposure = weight × remaining transmission / maximum transmission
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp = #shelter_ray_weight vin.comfort_tmp
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp *= #shelter_ray_transmission vin.comfort_tmp
scoreboard players operation #shelter_ray_exposure vin.comfort_tmp /= #shelter_transmission_max vin.comfort_meta

scoreboard players operation @s vin.shelter -= #shelter_ray_exposure vin.comfort_tmp

return 1