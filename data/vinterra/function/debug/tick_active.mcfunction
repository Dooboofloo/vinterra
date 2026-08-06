# vinterra:debug/tick_active
# Displays debug info to tagged players

## Handle scheduled reports
execute as @a[tag=vin.debug_profile_active] unless data storage vinterra:debug profile.active run tag @s remove vin.debug_profile_active
scoreboard players add @a[tag=vin.debug_profile_active] vin.debug_profile_timer 1

# Scheduled reports at:
# 1 second
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=20}] run function vinterra:debug/profile/report
# 5 seconds
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=100}] run function vinterra:debug/profile/report
# 10 seconds
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=200}] run function vinterra:debug/profile/report
# 15 seconds
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=300}] run function vinterra:debug/profile/report
# # 30 seconds
# execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=600}] run function vinterra:debug/profile/report
# # 60 seconds
# execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=1200}] run function vinterra:debug/profile/report

# Finish reporting
execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=300..}] run function vinterra:debug/profile/finish
# execute as @a[tag=vin.debug_profile_active,scores={vin.debug_profile_timer=1200..}] run function vinterra:debug/profile/finish


### True debug output
scoreboard players set @a vin.debug_covered 0
scoreboard players set @a[tag=vin.player_covered] vin.debug_covered 1

execute as @a[tag=vin.debug_viewer] run title @s actionbar [{text:"W: "},{score:{name:"@s",objective:"vin.warmth_effective"}},{text:" ➡ "},{score:{name:"@s",objective:"vin.warmth_target"}},{text:" | AM: "},{score:{name:"@s",objective:"vin.warmth_ambient"}},{text:" | C:"},{score:{name:"@s",objective:"vin.debug_covered"}},{text:" S: "},{score:{name:"@s",objective:"vin.shelter"}},{text:" | WB: "},{score:{name:"@s",objective:"vin.warmth_band"}},{text:" | CE: "},{score:{name:"@s",objective:"vin.cold_exposure"}},{text:" ("},{score:{name:"@s",objective:"vin.cold_stage"}},{text:")"},{text:" | WX: "},{score:{name:"#state",objective:"vin.weather"}},{text:" "},{score:{name:"#timer",objective:"vin.weather"}},{text:"/"},{score:{name:"#duration",objective:"vin.weather"}}]