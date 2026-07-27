# vinterra:survival/warmth/band/classify_recover
# Classifies effective warmth into vin.warmth_tmp for recovering players (cold -> warm)
# Must be executed as the player

# Default to Freezing
scoreboard players set @s vin.warmth_tmp -3

execute if score @s vin.warmth_effective >= #band_frigid_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp -2
execute if score @s vin.warmth_effective >= #band_cold_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp -1
execute if score @s vin.warmth_effective >= #band_warm_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 0
execute if score @s vin.warmth_effective >= #band_hot_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 1
execute if score @s vin.warmth_effective >= #band_scorching_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 2
execute if score @s vin.warmth_effective >= #band_scalding_recover vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 3