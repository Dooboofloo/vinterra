# vinterra:debug/profile/report
# Reports important values about the player's current state and records them in storage

scoreboard players set @s vin.debug_covered 0
execute if entity @s[tag=vin.player_covered] run scoreboard players set @s vin.debug_covered 1

# Initialize sample storage
data modify storage vinterra:debug profile.sample set value {ticks:0,time:0,phase:0,weather:0,warmth:{effective:0,target:0,band:0,ambient:0,block:0,equipment:0},blocks:{heat_raw:0,heat_total:0,cold_raw:0,cold_total:0},equipment:{insulation:0,cold:0},comfort:{total:0,blocks_raw:0,equipment_raw:0},wetness:0,exposure:{value:0,stage:0},covered:0b,shelter:0,active_players:0,recalc_wait:0}

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
execute store result storage vinterra:debug profile.sample.active_players int 1 run scoreboard players get #participants vin.schedule_meta
execute store result storage vinterra:debug profile.sample.recalc_wait int 1 run scoreboard players get @s vin.recalc_wait

# Record sample
data modify storage vinterra:debug profile.active.samples append from storage vinterra:debug profile.sample

# Report progress
tellraw @s [{text:"Progress: "},{score:{name:"@s",objective:"vin.debug_profile_timer"}},{text:"/"},{score:{name:"#duration",objective:"vin.debug_profile_meta"}}]

return 1