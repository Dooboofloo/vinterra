# vinterra:survival/comfort/shelter/raycast/finalize
# Adds the sheltered portion of the current ray's weight to the player
# Must be executed as the player

# Debug the point where a partially sheltered ray reaches its distance limit
execute if entity @s[tag=vin.debug_visualizer] if score #shelter_ray_blocking vin.comfort_tmp < #shelter_ray_blocking_max vin.comfort_meta run summon block_display ~ ~ ~ {Glowing:1b,Tags:["vin.shelter_debug"],glow_color_override:16711680,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.125f,-0.125f,-0.125f],scale:[0.25f,0.25f,0.25f]},block_state:{Name:"minecraft:lantern"}}

# contribution = weight × accumulated shelter / maximum shelter
scoreboard players operation #shelter_ray_contribution vin.comfort_tmp = #shelter_ray_weight vin.comfort_tmp
scoreboard players operation #shelter_ray_contribution vin.comfort_tmp *= #shelter_ray_blocking vin.comfort_tmp
scoreboard players operation #shelter_ray_contribution vin.comfort_tmp /= #shelter_ray_blocking_max vin.comfort_meta

scoreboard players operation @s vin.shelter += #shelter_ray_contribution vin.comfort_tmp

# Defensive global clamp
execute if score @s vin.shelter > #shelter_max vin.comfort_meta run scoreboard players operation @s vin.shelter = #shelter_max vin.comfort_meta

return 1