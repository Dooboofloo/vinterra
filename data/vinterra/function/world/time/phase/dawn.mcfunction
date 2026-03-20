# vinterra:world/time/phase/dawn
# Computes the current "sky time" based on the current "vin time" during the dawn phase
# Maps 66000..71999 to 23000..23999
# sky = 23000 + ((time - 66000) * 1000) // 6000

# Compute tmp = ((time - 66000) * 1000) // 6000
scoreboard players operation #tmp vin.time_math = #time_mod vin.time
scoreboard players operation #tmp vin.time_math -= #66000 vin.time_const
scoreboard players operation #tmp vin.time_math *= #1000 vin.time_const
scoreboard players operation #tmp vin.time_math /= #6000 vin.time_const

# Compute 23000 + tmp
scoreboard players operation #sky_cycle vin.time = #23000 vin.time_const
scoreboard players operation #sky_cycle vin.time += #tmp vin.time_math