# vinterra:survival/comfort/shelter/candidate/spawn
# Creates a candidate shelter node at the current execution position
# #shelter_candidate_depth contains its horizontal depth
# Must be executed as the player

# Defensive cleanup
kill @e[type=marker,tag=vin.shelter_candidate]

summon marker ~ ~ ~ {Tags:["vin.shelter_candidate"]}

scoreboard players operation @e[type=marker,tag=vin.shelter_candidate,sort=nearest,limit=1] vin.shelter_depth = #shelter_candidate_depth vin.comfort_tmp
scoreboard players set #shelter_rise vin.comfort_tmp 0

return run function vinterra:survival/comfort/shelter/candidate/normalize