# vinterra:world/time/phase/day
# Computes the current "sky time" based on the current "vin time" during the day phase
# Maps 0..11999 onto 0..11999
# sky = time

scoreboard players operation #sky_cycle vin.time = #time_mod vin.time