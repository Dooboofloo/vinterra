# vinterra:world/time/sleep/check_player
# Reads one eligible Overworld player's current sleep state
# Must be executed as and at the player

scoreboard players add #sleep_eligible vin.time_meta 1

# A sleep timer of 100 means the player has completed vanilla's sleep wind-up
execute if predicate vinterra:player/asleep run scoreboard players add #sleeping vin.time_meta 1

return 1