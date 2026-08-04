# vinterra:world/snow/accumulation/attempt
# Spreads the executing snow probe around its selected player anchor
# Must be executed as and at vin.snow_probe

scoreboard players set #spread_success vin.snow 0

# Select a random column within 64 blocks of the anchor
execute store success score #spread_success vin.snow run spreadplayers ~ ~ 0 64 false @s
execute unless score #spread_success vin.snow matches 1 run return 0

# Center the sampled column and evaluate its world surface
return run execute at @s align xz positioned ~0.5 ~ ~0.5 positioned over world_surface run function vinterra:world/snow/accumulation/place