# vinterra:feedback/hud/update
# Builds and displays the Survival UI for one player
# Must be executed as an initialized living player

# Safe defaults also cover the few ticks before a new player's Warmth band is first classified
data modify storage vinterra:feedback hud set value {warmth_name:"Warm",warmth_color:"green",wetness_name:"Dry",wetness_color:"gray",exposure_color:"gray",exposure_1:"□",exposure_1_color:"gray",exposure_2:"□",exposure_2_color:"gray",exposure_3:"□",exposure_3_color:"gray",exposure_4:"□",exposure_4_color:"gray",exposure_5:"□",exposure_5_color:"gray",exposure_6:"□",exposure_6_color:"gray",exposure_7:"□",exposure_7_color:"gray",exposure_8:"□",exposure_8_color:"gray",exposure_9:"□",exposure_9_color:"gray",exposure_10:"□",exposure_10_color:"gray"}

## Warmth band
execute if score @s vin.warmth_band matches -3 run function vinterra:feedback/hud/warmth/freezing
execute if score @s vin.warmth_band matches -2 run function vinterra:feedback/hud/warmth/frigid
execute if score @s vin.warmth_band matches -1 run function vinterra:feedback/hud/warmth/cold
execute if score @s vin.warmth_band matches 0 run function vinterra:feedback/hud/warmth/warm
execute if score @s vin.warmth_band matches 1 run function vinterra:feedback/hud/warmth/hot
execute if score @s vin.warmth_band matches 2 run function vinterra:feedback/hud/warmth/scorching
execute if score @s vin.warmth_band matches 3 run function vinterra:feedback/hud/warmth/scalding

## Wetness display bands
# 0 = Dry, 1-399 = Damp, 400-999 = Wet, 1000-1600 = Soaked
execute if score @s vin.wetness matches 1..399 run function vinterra:feedback/hud/wetness/damp
execute if score @s vin.wetness matches 400..999 run function vinterra:feedback/hud/wetness/wet
execute if score @s vin.wetness matches 1000.. run function vinterra:feedback/hud/wetness/soaked

## Cold Exposure bar
# Quantize the 0-350 exposure value into 0-9 filled segments, with a 10th segment being reserved for "Dangerous Freezing"
scoreboard players operation @s vin.feedback_tmp = @s vin.cold_exposure
scoreboard players operation @s vin.feedback_tmp *= #bar_steps vin.feedback_meta
scoreboard players operation @s vin.feedback_tmp /= #exposure_stage_3_min vin.warmth_meta
execute if score @s vin.feedback_tmp matches ..-1 run scoreboard players set @s vin.feedback_tmp 0
execute if score @s vin.feedback_tmp > #bar_steps vin.feedback_meta run scoreboard players operation @s vin.feedback_tmp = #bar_steps vin.feedback_meta

# Color and fill the exposure bar
function vinterra:feedback/hud/exposure/segments

# Color Exposure indicator
execute if score @s vin.cold_stage matches 1.. run data modify storage vinterra:feedback hud.exposure_color set value "gold"
execute if score @s vin.cold_stage matches 2.. run data modify storage vinterra:feedback hud.exposure_color set value "red"
execute if score @s vin.cold_stage matches 3.. run data modify storage vinterra:feedback hud.exposure_color set value "dark_red"
execute if score @s vin.cold_exposure >= #exposure_target_freezing vin.warmth_meta run data modify storage vinterra:feedback hud.exposure_color set value "#380000"

# Render immediately; the shared storage compound is safe because function execution is sequential
function vinterra:feedback/hud/render_macro with storage vinterra:feedback hud

return 1
