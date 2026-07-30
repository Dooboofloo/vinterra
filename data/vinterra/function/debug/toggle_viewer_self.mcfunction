# vinterra:debug/toggle_viewer_self
# Toggles player's vin.debug_viewer tag
# Must be executed as player

execute if entity @s[tag=!vin.debug_viewer] run return run tag @s add vin.debug_viewer
return run tag @s remove vin.debug_viewer