# vinterra:world/time/phase/night
# Computes the current "sky time" based on the current "vin time" during the night phase
# Maps 18000..65999 onto 13000..22999
# sky = 13000 + ((time - 18000) * 10000) // 48000

# Compute tmp = ((time - 18000) * 10000) // 48000
scoreboard players operation #tmp vin.time_math = #time_mod vin.time
scoreboard players operation #tmp vin.time_math -= #18000 vin.time_const
scoreboard players operation #tmp vin.time_math *= #10000 vin.time_const
scoreboard players operation #tmp vin.time_math /= #48000 vin.time_const

# Compute 13000 + tmp
scoreboard players operation #sky_cycle vin.time = #13000 vin.time_const
scoreboard players operation #sky_cycle vin.time += #tmp vin.time_math