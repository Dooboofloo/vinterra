# vinterra:survival/warmth/ambient/weather/apply
# Applies the current temporary weather's ambient warmth contribution
# Must be executed as and at the player

# TODO: This state technically represents both rain and snow, depending on where in the world the player is
# Find a better name for it

# The global weather system currently affects only the Overworld
execute unless dimension minecraft:overworld run return 0

execute if function vinterra:world/weather/api/is_snowfall run return run scoreboard players operation @s vin.warmth_ambient += #weather_snow vin.warmth_meta
execute if function vinterra:world/weather/api/is_blizzard run return run scoreboard players operation @s vin.warmth_ambient += #weather_blizzard vin.warmth_meta

return 0