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

# Initialize warmth band
scoreboard players reset @s vin.warmth_band

# Initialize cold exposure
scoreboard players set @s vin.cold_exposure 0
scoreboard players reset @s vin.cold_stage

# Request urgent survival recalculation
function vinterra:player/request_recalc

# Tag the player as initialized
tag @s add vin.player_initialized

tellraw @a[tag=vin.debug_viewer] [{text:"[Player] Player Initialized: "}, {selector:"@s"}]