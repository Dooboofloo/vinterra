# vinterra:survival/comfort/shelter/candidate/normalize
# Moves the candidate upward until it reaches a ceiling or open sky
# Must be executed as the player

# Defensive guard
execute unless entity @e[type=marker,tag=vin.shelter_candidate,limit=1] run return 0

# A non-passable block immediately above forms the local ceiling
execute at @e[type=marker,tag=vin.shelter_candidate,limit=1] unless block ~ ~1 ~ #vinterra:shelter_flow_passable run return run function vinterra:survival/comfort/shelter/candidate/commit

# No ceiling within the vertical limit counts as open exposure
execute if score #shelter_rise vin.comfort_tmp >= #shelter_ceiling_limit vin.comfort_meta run scoreboard players set #shelter_leak vin.comfort_tmp 1
execute if score #shelter_leak vin.comfort_tmp matches 1 run kill @e[type=marker,tag=vin.shelter_candidate]
execute if score #shelter_leak vin.comfort_tmp matches 1 run return 0

# Continue rising through passable blocks
execute at @e[type=marker,tag=vin.shelter_candidate,limit=1] run tp @e[type=marker,tag=vin.shelter_candidate,sort=nearest,limit=1] ~ ~1 ~
scoreboard players add #shelter_rise vin.comfort_tmp 1

return run function vinterra:survival/comfort/shelter/candidate/normalize