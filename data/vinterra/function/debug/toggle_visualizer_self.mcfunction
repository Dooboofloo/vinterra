# vinterra:debug/toggle_visualizer_self
# Toggles player's vin.debug_visualizer tag
# Must be executed as player

execute if entity @s[tag=!vin.debug_visualizer] run return run tag @s add vin.debug_visualizer
return run tag @s remove vin.debug_visualizer