# vinterra:world/weather/changed
# Completes a weather-state transition

scoreboard players set #timer vin.weather 0

function vinterra:world/weather/roll_duration
function vinterra:world/weather/apply_current
function vinterra:world/weather/announce_current

# Weather changes affect every initialized living player's warmth target
# TODO: CHECK: Is this really necessary? Does it mess up any scheduling?
execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:player/request_recalc

return 1