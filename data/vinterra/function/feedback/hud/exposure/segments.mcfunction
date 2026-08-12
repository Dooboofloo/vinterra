# vinterra:feedback/hud/exposure/segments
# Builds the Cold Exposure bar's fill state and colors
# Must be executed as the displayed player
# vin.feedback_tmp contains the quantized exposure value from 0-9

# Segment 1: Cold range
execute if score @s vin.feedback_tmp matches 1.. run data modify storage vinterra:feedback hud.exposure_1 set value "■"
execute if score @s vin.warmth_band matches ..-1 run data modify storage vinterra:feedback hud.exposure_1_color set value "gold"

# Segment 2: Cold range
execute if score @s vin.feedback_tmp matches 2.. run data modify storage vinterra:feedback hud.exposure_2 set value "■"
execute if score @s vin.warmth_band matches ..-1 run data modify storage vinterra:feedback hud.exposure_2_color set value "gold"

# Segment 3: Reached Cold Stage 1
execute if score @s vin.feedback_tmp matches 3.. run data modify storage vinterra:feedback hud.exposure_3 set value "■"
execute if score @s vin.warmth_band matches ..-1 run data modify storage vinterra:feedback hud.exposure_3_color set value "gold"

# Segment 4: Frigid range
execute if score @s vin.feedback_tmp matches 4.. run data modify storage vinterra:feedback hud.exposure_4 set value "■"
execute if score @s vin.warmth_band matches ..-1 run data modify storage vinterra:feedback hud.exposure_4_color set value "red"

# Segment 5: Frigid range
execute if score @s vin.feedback_tmp matches 5.. run data modify storage vinterra:feedback hud.exposure_5 set value "■"
execute if score @s vin.warmth_band matches ..-2 run data modify storage vinterra:feedback hud.exposure_5_color set value "red"

# Segment 6: Reached Cold Stage 2
execute if score @s vin.feedback_tmp matches 6.. run data modify storage vinterra:feedback hud.exposure_6 set value "■"
execute if score @s vin.warmth_band matches ..-2 run data modify storage vinterra:feedback hud.exposure_6_color set value "red"

# Segment 7: Freezing range
execute if score @s vin.feedback_tmp matches 7.. run data modify storage vinterra:feedback hud.exposure_7 set value "■"
execute if score @s vin.warmth_band matches ..-2 run data modify storage vinterra:feedback hud.exposure_7_color set value "dark_red"

# Segment 8: Freezing range
execute if score @s vin.feedback_tmp matches 8.. run data modify storage vinterra:feedback hud.exposure_8 set value "■"
execute if score @s vin.warmth_band matches ..-3 run data modify storage vinterra:feedback hud.exposure_8_color set value "dark_red"

# Segment 9: Reached Cold Stage 3
execute if score @s vin.feedback_tmp matches 9.. run data modify storage vinterra:feedback hud.exposure_9 set value "■"
execute if score @s vin.warmth_band matches ..-3 run data modify storage vinterra:feedback hud.exposure_9_color set value "dark_red"

# Segment 10: Dangerous Freezing
execute if score @s vin.cold_exposure >= #exposure_dmg_threshold vin.warmth_meta run data modify storage vinterra:feedback hud.exposure_10 set value "■"
execute if score @s vin.warmth_band matches ..-3 run data modify storage vinterra:feedback hud.exposure_10_color set value "#380000"

return 1