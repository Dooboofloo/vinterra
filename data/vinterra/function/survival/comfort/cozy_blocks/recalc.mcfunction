# vinterra:survival/comfort/cozy_blocks/recalc
# Must be executed as and at the player

# There are multiple block categories, and each category can
# only contribute so much to the total comfort.
# Categories:
# - Campfire (2/block, max 4)
# - Bedding (1/bed, max 2)
# - Softness (carpets, wool) (0.25/block, max 2)
# - Decoration (bookshelves, shelves, candles, lanterns, pots, etc.) (0.25/block, max 2)
# - Banners (0.5/block, max 2)

# NOTE: Soul Campfires and Soul Lanterns do NOT contribute coziness. Something about supernatural heat being hotter but feeling uneasy

# Maximum from each category gives a total of 12
# Equipment (leather and fur-lined armor) may provide the rest

# Reset category accumulations
scoreboard players set #accumulated_campfire vin.comfort_tmp 0
scoreboard players set #accumulated_bedding vin.comfort_tmp 0
scoreboard players set #accumulated_softness vin.comfort_tmp 0
scoreboard players set #accumulated_decoration vin.comfort_tmp 0
scoreboard players set #accumulated_banner vin.comfort_tmp 0

# Accumulate category values in quarter-points
execute align xyz run function vinterra:survival/comfort/cozy_blocks/accumulate_generated

scoreboard players operation @s vin.comfort_blocks = #accumulated_campfire vin.comfort_tmp
scoreboard players operation @s vin.comfort_blocks += #accumulated_bedding vin.comfort_tmp
scoreboard players operation @s vin.comfort_blocks += #accumulated_softness vin.comfort_tmp
scoreboard players operation @s vin.comfort_blocks += #accumulated_decoration vin.comfort_tmp
scoreboard players operation @s vin.comfort_blocks += #accumulated_banner vin.comfort_tmp

return 1