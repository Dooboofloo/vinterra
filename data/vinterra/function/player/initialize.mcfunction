# vinterra:player/initialize
# Initializes player-owned variables
# Executed as a player upon first join

## vinterra:survival/comfort
# Initialize total Comfort
scoreboard players set @s vin.comfort 0
scoreboard players set @s vin.comfort_blocks 0
scoreboard players set @s vin.comfort_equipment 0

# Initialize wetness
scoreboard players set @s vin.wetness 0

# Initialize environmental isolation
scoreboard players set @s vin.shelter 0

# Initialize environmental coverage state
tag @s remove vin.player_covered

## vinterra:survival/warmth
# Initialize warmth and other related values
scoreboard players operation @s vin.warmth_target = #warmth_default vin.player_meta
scoreboard players operation @s vin.warmth_effective = #warmth_default vin.player_meta

# Set player grace period timer
scoreboard players operation @s vin.player_grace_counter = #warmth_grace_period vin.player_meta

scoreboard players set @s vin.block_heat_raw 0
scoreboard players set @s vin.block_heat_total 0

scoreboard players set @s vin.block_cold_raw 0
scoreboard players set @s vin.block_cold_total 0

# Initialize warmth band
scoreboard players reset @s vin.warmth_band

# Initialize cold exposure
function vinterra:survival/warmth/cold_exposure/reset

# Initialize player health attributes
function vinterra:player/health/initialize

## Request urgent survival recalculation
function vinterra:player/request_recalc

## Tag the player as initialized
tag @s add vin.player_initialized

tellraw @a[tag=vin.debug_viewer] [{text:"[Player] Player Initialized: "}, {selector:"@s"}]