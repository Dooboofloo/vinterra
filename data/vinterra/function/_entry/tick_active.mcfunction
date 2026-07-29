# vinterra:_entry/tick_active
# Main active tick entry point for the datapack. Calls only the top-level active tick function of each module (if it exists)
# Active tick functions (including this one) are only run if there is at least one player online

# Module load order:
# World -> Player -> Survival

# Module active tick functions
function vinterra:world/tick_active
function vinterra:player/tick_active
function vinterra:survival/tick_active


# DEBUG

### True debug output

scoreboard players set @a vin.debug_covered 0
scoreboard players set @a[tag=vin.player_covered] vin.debug_covered 1

# W: {warmth_effective} ➡ {warmth_target} | EQ: {warmth_equipment} (I: {equip_insulation} C: {equip_cold}) | WB: {warmth_band} | CE: {cold_exposure} ({cold_stage}) 
execute as @a[tag=vin.debug_viewer] run title @s actionbar [{text:"W: "},{score:{name:"@s",objective:"vin.warmth_effective"}},{text:" ➡ "},{score:{name:"@s",objective:"vin.warmth_target"}},{text:" | AM: "},{score:{name:"@s",objective:"vin.warmth_ambient"}},{text:" | C:"},{score:{name:"@s",objective:"vin.debug_covered"}},{text:" S: "},{score:{name:"@s",objective:"vin.shelter"}},{text:" | WB: "},{score:{name:"@s",objective:"vin.warmth_band"}},{text:" | CE: "},{score:{name:"@s",objective:"vin.cold_exposure"}},{text:" ("},{score:{name:"@s",objective:"vin.cold_stage"}},{text:")"}]