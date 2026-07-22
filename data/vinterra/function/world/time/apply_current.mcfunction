# vinterra:world/time/apply_current
# Computes and applies the current "sky time" based on the current "vin time"
# Stores result in command storage vinterra:runtime

# Compute the current cycle's sky time
function vinterra:world/time/compute_sky

# Compute the final sky time by adding the number of days elapsed to the current cycle's sky time
scoreboard players operation #sky vin.time = #day vin.time
scoreboard players operation #sky vin.time *= #24000 vin.time_meta
scoreboard players operation #sky vin.time += #sky_cycle vin.time

execute store result storage vinterra:runtime time.value int 1 run scoreboard players get #sky vin.time
function vinterra:world/time/apply_macro with storage vinterra:runtime time