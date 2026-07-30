# vinterra:debug/tick_active
# Displays debug info to tagged players

### True debug output
scoreboard players set @a vin.debug_covered 0
scoreboard players set @a[tag=vin.player_covered] vin.debug_covered 1

# W: {warmth_effective} ➡ {warmth_target} | EQ: {warmth_equipment} (I: {equip_insulation} C: {equip_cold}) | WB: {warmth_band} | CE: {cold_exposure} ({cold_stage}) 
execute as @a[tag=vin.debug_viewer] run title @s actionbar [{text:"W: "},{score:{name:"@s",objective:"vin.warmth_effective"}},{text:" ➡ "},{score:{name:"@s",objective:"vin.warmth_target"}},{text:" | AM: "},{score:{name:"@s",objective:"vin.warmth_ambient"}},{text:" | C:"},{score:{name:"@s",objective:"vin.debug_covered"}},{text:" S: "},{score:{name:"@s",objective:"vin.shelter"}},{text:" | WB: "},{score:{name:"@s",objective:"vin.warmth_band"}},{text:" | CE: "},{score:{name:"@s",objective:"vin.cold_exposure"}},{text:" ("},{score:{name:"@s",objective:"vin.cold_stage"}},{text:")"},{text:" | WX: "},{score:{name:"#state",objective:"vin.weather"}},{text:" "},{score:{name:"#timer",objective:"vin.weather"}},{text:"/"},{score:{name:"#duration",objective:"vin.weather"}}]