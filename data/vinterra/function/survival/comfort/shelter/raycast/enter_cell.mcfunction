# vinterra:survival/comfort/shelter/raycast/enter_cell
# Records and evaluates one newly entered block cell
# Must be executed as the player at the center of that block cell

execute if entity @e[type=marker,tag=vin.shelter_cell,limit=1] run tp @e[type=marker,tag=vin.shelter_cell,limit=1] ~ ~ ~
execute unless entity @e[type=marker,tag=vin.shelter_cell,limit=1] run summon marker ~ ~ ~ {Tags:["vin.shelter_cell"]}

function vinterra:survival/comfort/shelter/raycast/evaluate_block

return 1