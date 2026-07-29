# vinterra:survival/comfort/shelter/search/expand_current
# Expands the current shelter-volume node in all six cardinal directions
# Must be executed as the player

execute at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~1 ~ ~ run function vinterra:survival/comfort/shelter/search/try_neighbor
execute if score #shelter_overflow vin.comfort_tmp matches 0 at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~-1 ~ ~ run function vinterra:survival/comfort/shelter/search/try_neighbor
execute if score #shelter_overflow vin.comfort_tmp matches 0 at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~ ~ ~1 run function vinterra:survival/comfort/shelter/search/try_neighbor
execute if score #shelter_overflow vin.comfort_tmp matches 0 at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~ ~ ~-1 run function vinterra:survival/comfort/shelter/search/try_neighbor
execute if score #shelter_overflow vin.comfort_tmp matches 0 at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~ ~1 ~ run function vinterra:survival/comfort/shelter/search/try_neighbor
execute if score #shelter_overflow vin.comfort_tmp matches 0 at @e[type=marker,tag=vin.shelter_current,limit=1] positioned ~ ~-1 ~ run function vinterra:survival/comfort/shelter/search/try_neighbor

return 1