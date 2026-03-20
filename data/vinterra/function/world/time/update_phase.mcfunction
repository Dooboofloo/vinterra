# vinterra:world/time/update_phase
# Calculate the current phase based on the world cycle time
# Day = 0, Dusk = 1, Night = 2, Dawn = 3

execute if score #time_mod vin.time matches 0..11999 run scoreboard players set #phase vin.time 0
execute if score #time_mod vin.time matches 12000..17999 run scoreboard players set #phase vin.time 1
execute if score #time_mod vin.time matches 18000..65999 run scoreboard players set #phase vin.time 2
execute if score #time_mod vin.time matches 66000..71999 run scoreboard players set #phase vin.time 3