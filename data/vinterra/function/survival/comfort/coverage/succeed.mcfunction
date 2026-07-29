# vinterra:survival/comfort/coverage/succeed
# Completes a successful direct-coverage calculation
# Must be executed as the player

# Defensive guard
execute unless entity @e[type=marker,tag=vin.coverage_probe,limit=1] run return run function vinterra:survival/comfort/coverage/fail

tag @s add vin.player_covered
function vinterra:survival/comfort/coverage/cleanup

return 1