# vinterra:player/respawn
# Resets player-owned variables
# Executed as a player when they respawn

# vinterra:survival/comfort/wetness
# Reset wetness
scoreboard players set @s vin.wetness 0

# vinterra:survival/warmth
# Reset warmth
scoreboard players operation @s vin.warmth_target = #warmth_default vin.player_meta
scoreboard players operation @s vin.warmth_effective = #warmth_default vin.player_meta

# TODO: Request urgent warmth recalculation