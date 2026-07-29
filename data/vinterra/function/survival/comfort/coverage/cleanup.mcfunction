# vinterra:survival/comfort/coverage/cleanup
# Removes all temporary coverage-calculation entities
# The survival scheduler guarantees only one active player recalculation

kill @e[type=marker,tag=vin.coverage_probe]
kill @e[type=marker,tag=vin.coverage_limit]

return 1