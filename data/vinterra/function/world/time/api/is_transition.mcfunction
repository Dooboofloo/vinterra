# vinterra:world/time/api/is_transition
# Returns true if the current phase is dawn OR dusk
# Usage: execute if function vinterra:world/time/api/is_transition ...

execute if score #phase vin.time matches 1 run return 1
execute if score #phase vin.time matches 3 run return 1
return 0