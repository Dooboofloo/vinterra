# vinterra:survival/comfort/shelter/succeed
# Completes a successful shelter calculation
# Must be executed as the player

tellraw @s[tag=vin.debug_viewer] [{text:"[Shelter] Sheltered | Nodes: ",color:"green"},{score:{name:"#shelter_nodes",objective:"vin.comfort_tmp"}},{text:" | Leak: ",color:"green"},{score:{name:"#shelter_leak",objective:"vin.comfort_tmp"}}]

tag @s add vin.player_sheltered
function vinterra:survival/comfort/shelter/cleanup

return 1