# vinterra:survival/comfort/coverage/recalc
# Determines whether precipitation is directly blocked above the player
# Must be executed as and at the player
# The survival scheduler guarantees only one active player recalculation

function vinterra:survival/comfort/coverage/cleanup
tag @s remove vin.player_covered

# Use the world-surface heightmap only as a finite upper bound
execute positioned over world_surface run summon marker ~ ~ ~ {Tags:["vin.coverage_limit"]}
execute store result score #coverage_limit_y vin.comfort_tmp run data get entity @e[type=marker,tag=vin.coverage_limit,limit=1] Pos[1] 1
kill @e[type=marker,tag=vin.coverage_limit]

# Begin in the block containing the player's eyes
execute anchored eyes positioned ^ ^ ^ align xyz run summon marker ~ ~ ~ {Tags:["vin.coverage_probe"]}
execute store result score #coverage_probe_y vin.comfort_tmp run data get entity @e[type=marker,tag=vin.coverage_probe,limit=1] Pos[1] 1

# Nothing in this column exists above the player's eye block
execute if score #coverage_limit_y vin.comfort_tmp <= #coverage_probe_y vin.comfort_tmp run return run function vinterra:survival/comfort/coverage/fail

# Scan upward until a coverage-blocking block or the column limit is reached
return run function vinterra:survival/comfort/coverage/scan