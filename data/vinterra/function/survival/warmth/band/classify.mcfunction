# vinterra:survival/warmth/band/classify
# Classifies effective warmth into vin.warmth_tmp
# Must be executed as the player

# Default to Freezing
scoreboard players set @s vin.warmth_tmp -3

execute if score @s vin.warmth_effective >= #band_frigid_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp -2
execute if score @s vin.warmth_effective >= #band_cold_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp -1
execute if score @s vin.warmth_effective >= #band_warm_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 0
execute if score @s vin.warmth_effective >= #band_hot_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 1
execute if score @s vin.warmth_effective >= #band_scorching_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 2
execute if score @s vin.warmth_effective >= #band_scalding_min vin.warmth_meta run scoreboard players set @s vin.warmth_tmp 3