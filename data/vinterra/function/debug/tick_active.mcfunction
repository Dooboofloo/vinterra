# vinterra:debug/tick_active
# Displays debug info to tagged players

## Handle scheduled reports
execute as @a[tag=vin.debug_profile_active] unless data storage vinterra:debug profile.active run tag @s remove vin.debug_profile_active

# Increment timers
scoreboard players add @a[tag=vin.debug_profile_active] vin.debug_profile_timer 1

# Report once every specified interval
execute as @a[tag=vin.debug_profile_active] run scoreboard players operation @s vin.debug_profile_time_mod = @s vin.debug_profile_timer
execute as @a[tag=vin.debug_profile_active] run scoreboard players operation @s vin.debug_profile_time_mod %= #interval vin.debug_profile_meta
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_time_mod=0}] run function vinterra:debug/profile/report

# Capture the terminal state when duration is not an interval boundary
execute as @a[tag=vin.debug_profile_active] if score @s vin.debug_profile_timer >= #duration vin.debug_profile_meta unless score @s vin.debug_profile_time_mod matches 0 run function vinterra:debug/profile/report

# Finish reporting
execute as @a[tag=vin.debug_profile_active] if score @s vin.debug_profile_timer >= #duration vin.debug_profile_meta run function vinterra:debug/profile/finish


### True debug output
scoreboard players set @a vin.debug_covered 0
scoreboard players set @a[tag=vin.player_covered] vin.debug_covered 1

execute as @a[tag=vin.debug_viewer] run title @s actionbar [{text:"W: "},{score:{name:"@s",objective:"vin.warmth_effective"}},{text:" ➡ "},{score:{name:"@s",objective:"vin.warmth_target"}},{text:" | AM: "},{score:{name:"@s",objective:"vin.warmth_ambient"}},{text:" | C:"},{score:{name:"@s",objective:"vin.debug_covered"}},{text:" S: "},{score:{name:"@s",objective:"vin.shelter"}},{text:" | WB: "},{score:{name:"@s",objective:"vin.warmth_band"}},{text:" | CE: "},{score:{name:"@s",objective:"vin.cold_exposure"}},{text:" ("},{score:{name:"@s",objective:"vin.cold_stage"}},{text:")"},{text:" | WX: "},{score:{name:"#state",objective:"vin.weather"}},{text:" "},{score:{name:"#timer",objective:"vin.weather"}},{text:"/"},{score:{name:"#duration",objective:"vin.weather"}}]