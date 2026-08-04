# vinterra:world/snow/accumulation/loop
# Performs each remaining attempt using the shared probe

execute unless score #attempts_remaining vin.snow matches 1.. run return 0

scoreboard players remove #attempts_remaining vin.snow 1

# Select a new random eligible player for every attempt
execute at @a[tag=vin.snow_candidate,sort=random,limit=1] run tp @e[type=marker,tag=vin.snow_probe,limit=1] ~ ~ ~

# Perform the attempt and record whether it actually changed a block
scoreboard players set #attempt_result vin.snow 0
execute as @e[type=marker,tag=vin.snow_probe,limit=1] at @s store result score #attempt_result vin.snow run function vinterra:world/snow/accumulation/attempt
scoreboard players operation #pulse_successes vin.snow += #attempt_result vin.snow

return run function vinterra:world/snow/accumulation/loop