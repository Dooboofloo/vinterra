# vinterra:survival/comfort/wetness/become_dryer
# Decrease wetness over time. Drying becomes faster for nearby block heat landmarks

# Start with passive drying
scoreboard players operation #dry_loss vin.comfort_meta = #wetness_dry_loss vin.comfort_meta

# Copy the previous total block heat calculation
scoreboard players set #block_drying vin.comfort_meta 0
scoreboard players operation #block_drying vin.comfort_meta = @s vin.block_heat_total

# Convert total block heat into additional drying
scoreboard players operation #block_drying vin.comfort_meta /= #drying_scale vin.comfort_meta
scoreboard players operation #dry_loss vin.comfort_meta += #block_drying vin.comfort_meta

# Apply and clamp
scoreboard players operation @s vin.wetness -= #dry_loss vin.comfort_meta
execute if score @s vin.wetness matches ..-1 run scoreboard players set @s vin.wetness 0