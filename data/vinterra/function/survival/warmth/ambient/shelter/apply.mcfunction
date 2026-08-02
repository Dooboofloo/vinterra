# vinterra:survival/warmth/ambient/shelter/apply
# Scales environmental ambient warmth according to player-local shelter
# Must be executed as the player
#
# No shelter retains 100% of outside ambient conditions.
# Max shelter retains 0% of outside ambient conditions.

# Shelter effectiveness is gated from 25% to 100% through Comfort

# Shelter isolation factor ranges from 16/64 at 0 Comfort to 64/64 at 16 Comfort
scoreboard players operation #shelter_isolation vin.warmth_tmp = @s vin.comfort
scoreboard players operation #shelter_isolation vin.warmth_tmp *= #3 vin.warmth_meta
scoreboard players add #shelter_isolation vin.warmth_tmp 16

# Blocked Ambient = Raw Ambient × isolation factor × normalized Shelter^2
scoreboard players operation @s vin.warmth_tmp = @s vin.warmth_ambient

scoreboard players operation @s vin.warmth_tmp *= #shelter_isolation vin.warmth_tmp

scoreboard players operation @s vin.warmth_tmp *= @s vin.shelter
scoreboard players operation @s vin.warmth_tmp /= #shelter_max vin.comfort_meta
scoreboard players operation @s vin.warmth_tmp *= @s vin.shelter
scoreboard players operation @s vin.warmth_tmp /= #shelter_max vin.comfort_meta

scoreboard players operation @s vin.warmth_tmp /= #64 vin.warmth_meta

scoreboard players operation @s vin.warmth_ambient -= @s vin.warmth_tmp

return 1