# vinterra:world/time/sleep/update
# Starts, maintains, commits, or ends the accelerated sleep session

scoreboard players operation #sleep_was_active vin.time_meta = #sleep_active vin.time_meta
scoreboard players set #sleep_eligible vin.time_meta 0
scoreboard players set #sleeping vin.time_meta 0

# Count initialized, living, non-spectator players in the Overworld
execute as @a[tag=vin.player_initialized,gamemode=!spectator,predicate=!vinterra:player/currently_dead] at @s if dimension minecraft:overworld run function vinterra:world/time/sleep/check_player

# End a completed sleep session once the Vinterra clock reaches the new day
execute if score #sleep_active vin.time_meta matches 1 if score #time_mod vin.time matches 0..11999 run scoreboard players set #sleep_active vin.time_meta 0

# Cancel an uncommitted session if time advancement is disabled
execute if score #sleep_active vin.time_meta matches 1 if score #time_mod vin.time matches 12000..68759 if score #advance_time vin.time_meta matches 0 run scoreboard players set #sleep_active vin.time_meta 0

# Before the earliest natural wake point, every eligible player must remain fully asleep
execute if score #sleep_active vin.time_meta matches 1 if score #time_mod vin.time matches 12000..68759 unless score #sleep_eligible vin.time_meta matches 1.. run scoreboard players set #sleep_active vin.time_meta 0
execute if score #sleep_active vin.time_meta matches 1 if score #time_mod vin.time matches 12000..68759 unless score #sleeping vin.time_meta = #sleep_eligible vin.time_meta run scoreboard players set #sleep_active vin.time_meta 0

# Begin a new session when all eligible players are fully asleep
execute if score #sleep_active vin.time_meta matches 0 unless score #advance_time vin.time_meta matches 0 if score #time_mod vin.time matches 12000..71999 if score #sleep_eligible vin.time_meta matches 1.. if score #sleeping vin.time_meta = #sleep_eligible vin.time_meta run scoreboard players set #sleep_active vin.time_meta 1

# Transition feedback
execute if score #sleep_active vin.time_meta matches 1 unless score #sleep_was_active vin.time_meta matches 1 run tellraw @a {text:"The long night begins to pass as everyone rests...",color:"dark_gray",italic:true}
execute if score #sleep_was_active vin.time_meta matches 1 unless score #sleep_active vin.time_meta matches 1 if score #time_mod vin.time matches 12000..68759 run tellraw @a {text:"The night slows as the rest is interrupted.",color:"gray",italic:true}

return 1