# vinterra:survival/recalc
# Recalculates cached survival values for one player
# Must be executed as and at that player

# Debug output
# tellraw @a[tag=vin.debug_viewer] ["",{text:"[Survival] Recalculating: "},{selector:"@s"},{text:"\n     (Wait Time: "},{score:{name:"@s",objective:"vin.recalc_wait"}},{text:" ticks, Current Budget: "},{score:{name:"#budget",objective:"vin.schedule_meta"}},{text:")"}]

# function vinterra:survival/comfort/recalc # TODO: Uncomment this line once this function actually does something
function vinterra:survival/warmth/recalc