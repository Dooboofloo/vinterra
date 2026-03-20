# vinterra:world/time/compute_sky
# Dispatches to the appropriate phase handler, then computes the "sky time" based on the current "vin time"
# Stored in scoreboard value #sky vin.time

execute if function vinterra:world/time/api/is_day run function vinterra:world/time/phase/day
execute if function vinterra:world/time/api/is_dusk run function vinterra:world/time/phase/dusk
execute if function vinterra:world/time/api/is_night run function vinterra:world/time/phase/night
execute if function vinterra:world/time/api/is_dawn run function vinterra:world/time/phase/dawn