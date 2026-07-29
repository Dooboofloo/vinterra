# vinterra:survival/comfort/coverage/scan
# Scans upward through shelter-flow-passable blocks
# Must be executed as the player
#
# vin.coverage_probe marks the current vertical-search position.
# #coverage_probe_y contains its current block Y coordinate.
# #coverage_limit_y contains the world-surface upper bound.
# #coverage_rise contains the distance traveled from the player's eye block.

# Defensive guard
execute unless entity @e[type=marker,tag=vin.coverage_probe,limit=1] run return run function vinterra:survival/comfort/coverage/fail

# Reaching the top of the column without finding a blocking block means uncovered
execute if score #coverage_probe_y vin.comfort_tmp >= #coverage_limit_y vin.comfort_tmp run return run function vinterra:survival/comfort/coverage/fail

# The first non-passable block above the probe provides direct coverage
execute at @e[type=marker,tag=vin.coverage_probe,limit=1] unless block ~ ~1 ~ #vinterra:coverage_passable run return run function vinterra:survival/comfort/coverage/succeed

# Continue upward through the passable column
execute at @e[type=marker,tag=vin.coverage_probe,limit=1] run tp @e[type=marker,tag=vin.coverage_probe,limit=1] ~ ~1 ~
scoreboard players add #coverage_probe_y vin.comfort_tmp 1
scoreboard players add #coverage_rise vin.comfort_tmp 1

return run function vinterra:survival/comfort/coverage/scan