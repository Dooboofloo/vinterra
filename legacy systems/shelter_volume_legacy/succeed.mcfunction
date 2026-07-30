# vinterra:survival/comfort/shelter/succeed
# Completes a successful shelter calculation
# Must be executed as the player

scoreboard players operation @s vin.shelter = #shelter_max vin.comfort_meta
function vinterra:survival/comfort/shelter/cleanup

return 1