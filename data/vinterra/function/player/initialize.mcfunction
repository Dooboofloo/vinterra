# vinterra:player/initialize
# Initializes player-owned variables
# Executed as a player upon first join

# vinterra:survival/comfort/wetness
# Initialize wetness
scoreboard players set @s vin.wetness 0

# vinterra:survival/warmth
# Initialize warmth
scoreboard players operation @s vin.warmth_target = #warmth_default vin.player_meta
scoreboard players operation @s vin.warmth_effective = #warmth_default vin.player_meta

# TODO: Request urgent warmth recalculation

tag @s add vin.player_initialized