# vinterra:world/snow/accumulation/pulse
# Performs one bounded server-wide snow accumulation pulse

# Begin from known transient state
function vinterra:world/snow/accumulation/cleanup

# Only initialized, living, non-spectator Overworld players can anchor accumulation attempts
execute as @a[predicate=vinterra:player/participating] at @s if dimension minecraft:overworld run tag @s add vin.snow_candidate

# There may be online players but no eligible players in the Overworld
execute unless entity @a[tag=vin.snow_candidate] run return 0

# Create one reusable probe at a random eligible player
execute at @a[tag=vin.snow_candidate,sort=random,limit=1] run summon marker ~ ~ ~ {Tags:["vin.snow_probe"]}
execute unless entity @e[type=marker,tag=vin.snow_probe,limit=1] run return run function vinterra:world/snow/accumulation/cleanup

scoreboard players set #pulse_successes vin.snow 0

function vinterra:world/snow/accumulation/loop

function vinterra:world/snow/accumulation/cleanup

return 1