# vinterra:survival/comfort/wetness/become_dryer
# Decrease wetness over time

# Simply remove one wetness per tick. At max wetness (1600) and with no other intervention, this takes 80 seconds
scoreboard players operation @s vin.wetness -= #wetness_dry_loss vin.comfort_meta

# Clamp to 0
execute if score @s vin.wetness matches ..-1 run scoreboard players set @s vin.wetness 0

# TODO: Eventually, warmth will factor into decreasing wetness faster (from previous warmth calculation)