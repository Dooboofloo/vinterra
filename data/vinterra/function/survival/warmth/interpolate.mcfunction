# vinterra:survival/warmth/interpolate
# Interpolates target player's effective warmth toward their target warmth
# Must be executed as the player

# Delta = target - effective
scoreboard players operation @s vin.warmth_tmp = @s vin.warmth_target
scoreboard players operation @s vin.warmth_tmp -= @s vin.warmth_effective

# Already at target
execute if score @s vin.warmth_tmp matches 0 run return 0

# Proportional movement
scoreboard players operation @s vin.warmth_step = @s vin.warmth_tmp
scoreboard players operation @s vin.warmth_step /= #warmth_smoothing vin.warmth_meta

# Guarantee convergence despite integer division
execute if score @s vin.warmth_tmp matches 1.. if score @s vin.warmth_step matches ..0 run scoreboard players set @s vin.warmth_step 1
execute if score @s vin.warmth_tmp matches ..-1 if score @s vin.warmth_step matches 0.. run scoreboard players set @s vin.warmth_step -1

scoreboard players operation @s vin.warmth_effective += @s vin.warmth_step