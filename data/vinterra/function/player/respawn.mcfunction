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

# Reset warmth band
scoreboard players reset @s vin.warmth_band

# Reset cold exposure
function vinterra:survival/warmth/cold_exposure/reset

# Request urgent survival recalculation
function vinterra:player/request_recalc

tellraw @a[tag=vin.debug_viewer] [{text:"[Player] Player Respawned: "}, {selector:"@s"}]