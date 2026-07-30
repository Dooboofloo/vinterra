This system also relied on the following section in vinterra:survival/comfort/load

### ===== SHELTER =====

# Player local environmental isolation provided by surrounding structure
# Range: 0 (fully exposed) to 100 (fully sheltered)
scoreboard objectives add vin.shelter dummy

# Maximum shelter value
scoreboard players set #shelter_max vin.comfort_meta 100

# Maximum number of connected passable cells that may form a sheltered volume
scoreboard players set #shelter_volume_limit vin.comfort_meta 128