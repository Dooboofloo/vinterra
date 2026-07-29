# vinterra:survival/comfort/coverage/succeed
# Completes a successful direct-coverage calculation
# Must be executed as the player
#
# Leaves one vin.coverage_ceiling marker for shelter to consume.

# Defensive guard
execute unless entity @e[type=marker,tag=vin.coverage_probe,limit=1] run return run function vinterra:survival/comfort/coverage/fail

tag @s add vin.player_covered

# Center the handoff marker within its ceiling-adjacent block
execute at @e[type=marker,tag=vin.coverage_probe,limit=1] align xyz positioned ~0.5 ~0.5 ~0.5 run tp @e[type=marker,tag=vin.coverage_probe,limit=1] ~ ~ ~

# Convert the active scanner into the coverage-to-shelter handoff marker
tag @e[type=marker,tag=vin.coverage_probe,limit=1] add vin.coverage_ceiling
tag @e[type=marker,tag=vin.coverage_probe,limit=1] remove vin.coverage_probe

return 1