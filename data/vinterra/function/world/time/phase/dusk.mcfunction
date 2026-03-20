# vinterra:world/time/phase/dusk
# Computes the current "sky time" based on the current "vin time" during the dusk phase
# Maps 12000..17999 onto 12000..12999
# sky = 12000 + ((time - 12000) * 1000) // 6000

# Compute tmp = ((time - 12000) * 1000) // 6000
scoreboard players operation #tmp vin.time_math = #time_mod vin.time
scoreboard players operation #tmp vin.time_math -= #12000 vin.time_const
scoreboard players operation #tmp vin.time_math *= #1000 vin.time_const
scoreboard players operation #tmp vin.time_math /= #6000 vin.time_const

# Compute 12000 + tmp
scoreboard players operation #sky_cycle vin.time = #12000 vin.time_const
scoreboard players operation #sky_cycle vin.time += #tmp vin.time_math