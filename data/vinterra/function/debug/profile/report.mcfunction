# vinterra:debug/profile/report
# Reports important values about the player's current state and records them in storage

scoreboard players set @s vin.debug_covered 0
execute if entity @s[tag=vin.player_covered] run scoreboard players set @s vin.debug_covered 1

# Initialize sample storage
data modify storage vinterra:debug profile.sample set value {ticks:0,time:0,phase:0,weather:0,warmth:{effective:0,target:0,band:0,ambient:0,block:0,equipment:0},blocks:{heat_raw:0,heat_total:0,cold_raw:0,cold_total:0},equipment:{insulation:0,cold:0},comfort:{total:0,blocks_raw:0,equipment_raw:0},wetness:0,exposure:{value:0,stage:0},covered:0b,shelter:0,recalc_wait:0}

# Populate fields
execute store result storage vinterra:debug profile.sample.ticks int 1 run scoreboard players get @s vin.debug_profile_timer
execute store result storage vinterra:debug profile.sample.time int 1 run scoreboard players get #time vin.time
execute store result storage vinterra:debug profile.sample.phase int 1 run scoreboard players get #phase vin.time
execute store result storage vinterra:debug profile.sample.weather int 1 run scoreboard players get #state vin.weather
execute store result storage vinterra:debug profile.sample.warmth.effective int 1 run scoreboard players get @s vin.warmth_effective
execute store result storage vinterra:debug profile.sample.warmth.target int 1 run scoreboard players get @s vin.warmth_target
execute store result storage vinterra:debug profile.sample.warmth.band int 1 run scoreboard players get @s vin.warmth_band
execute store result storage vinterra:debug profile.sample.warmth.ambient int 1 run scoreboard players get @s vin.warmth_ambient
execute store result storage vinterra:debug profile.sample.warmth.block int 1 run scoreboard players get @s vin.warmth_block
execute store result storage vinterra:debug profile.sample.warmth.equipment int 1 run scoreboard players get @s vin.warmth_equipment
execute store result storage vinterra:debug profile.sample.blocks.heat_raw int 1 run scoreboard players get @s vin.block_heat_raw
execute store result storage vinterra:debug profile.sample.blocks.heat_total int 1 run scoreboard players get @s vin.block_heat_total
execute store result storage vinterra:debug profile.sample.blocks.cold_raw int 1 run scoreboard players get @s vin.block_cold_raw
execute store result storage vinterra:debug profile.sample.blocks.cold_total int 1 run scoreboard players get @s vin.block_cold_total
execute store result storage vinterra:debug profile.sample.equipment.insulation int 1 run scoreboard players get @s vin.equip_insulation
execute store result storage vinterra:debug profile.sample.equipment.cold int 1 run scoreboard players get @s vin.equip_cold
execute store result storage vinterra:debug profile.sample.comfort.total int 1 run scoreboard players get @s vin.comfort
execute store result storage vinterra:debug profile.sample.comfort.blocks_raw int 1 run scoreboard players get @s vin.comfort_blocks
execute store result storage vinterra:debug profile.sample.comfort.equipment_raw int 1 run scoreboard players get @s vin.comfort_equipment
execute store result storage vinterra:debug profile.sample.wetness int 1 run scoreboard players get @s vin.wetness
execute store result storage vinterra:debug profile.sample.exposure.value int 1 run scoreboard players get @s vin.cold_exposure
execute store result storage vinterra:debug profile.sample.exposure.stage int 1 run scoreboard players get @s vin.cold_stage
execute if entity @s[tag=vin.player_covered] run data modify storage vinterra:debug profile.sample.covered set value 1b
execute store result storage vinterra:debug profile.sample.shelter int 1 run scoreboard players get @s vin.shelter
execute store result storage vinterra:debug profile.sample.recalc_wait int 1 run scoreboard players get @s vin.recalc_wait

# Record sample
data modify storage vinterra:debug profile.active.samples append from storage vinterra:debug profile.sample

# Report some text to chat
tellraw @s ["",{text:"========== PROFILE REPORT ==========",color:"green"},{text:"\n"},{text:"Player: ",color:"green"},{selector:"@s",color:"green"},{text:"\n"},{text:"Ticks Since Start: ",color:"green"},{score:{name:"@s",objective:"vin.debug_profile_timer"},color:"green"},{text:"\n"},{text:"\n"},{text:"Time: ",color:"aqua"},{score:{name:"#time",objective:"vin.time"},color:"aqua"},{text:" (",color:"aqua"},{score:{name:"#phase",objective:"vin.time"},color:"aqua"},{text:")",color:"aqua"},{text:"\n"},{text:"Weather: ",color:"aqua"},{score:{name:"#state",objective:"vin.weather"},color:"aqua"},{text:"\n"},{text:"\n"},{text:"Warmth: ",color:"gold"},{score:{name:"@s",objective:"vin.warmth_effective"},color:"gold"},{text:" ➡ ",color:"gold"},{score:{name:"@s",objective:"vin.warmth_target"},color:"gold"},{text:" (Ambient: ",color:"gold"},{score:{name:"@s",objective:"vin.warmth_ambient"},color:"gold"},{text:", Block: ",color:"gold"},{score:{name:"@s",objective:"vin.warmth_block"},color:"gold"},{text:", Equipment: ",color:"gold"},{score:{name:"@s",objective:"vin.warmth_equipment"},color:"gold"},{text:")",color:"gold"},{text:"\n"},{text:"Comfort: ",color:"gold"},{score:{name:"@s",objective:"vin.comfort"},color:"gold"},{text:" (Block: ",color:"gold"},{score:{name:"@s",objective:"vin.comfort_blocks"},color:"gold"},{text:", Equipment: ",color:"gold"},{score:{name:"@s",objective:"vin.comfort_equipment"},color:"gold"},{text:")",color:"gold"},{text:"\n"},{text:"Wetness: ",color:"blue"},{score:{name:"@s",objective:"vin.wetness"},color:"blue"},{text:"/",color:"blue"},{score:{name:"#wetness_max",objective:"vin.comfort_meta"},color:"blue"},{text:"\n"},{text:"Cold Exposure: ",color:"dark_aqua"},{score:{name:"@s",objective:"vin.cold_exposure"},color:"dark_aqua"},{text:" (",color:"dark_aqua"},{score:{name:"@s",objective:"vin.cold_stage"},color:"dark_aqua"},{text:")",color:"dark_aqua"},{text:"\n"},{text:"\n"},{text:"Covered: "},{score:{name:"@s",objective:"vin.debug_covered"}},{text:"\n"},{text:"Shelter: "},{score:{name:"@s",objective:"vin.shelter"}},{text:"/"},{score:{name:"#shelter_max",objective:"vin.comfort_meta"}},{text:"\n"}]

return 1