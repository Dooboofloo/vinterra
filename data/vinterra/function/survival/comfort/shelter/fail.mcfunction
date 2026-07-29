# vinterra:survival/comfort/shelter/fail
# Completes an unsuccessful shelter calculation
# Must be executed as the player

tellraw @s[tag=vin.debug_viewer] [{text:"[Shelter] Exposed | Nodes: ",color:"red"},{score:{name:"#shelter_nodes",objective:"vin.comfort_tmp"}},{text:" | Leak: ",color:"red"},{score:{name:"#shelter_leak",objective:"vin.comfort_tmp"}}]

tag @s remove vin.player_sheltered
function vinterra:survival/comfort/shelter/cleanup

return 0