# vinterra:player/load
# Load entry point for the player module. Calls each submodule's load function

# Player helpers
scoreboard objectives add vin.player_meta dummy

# Detect respawns
scoreboard objectives add vin.player_respawn minecraft.custom:time_since_death

# A player's inherent body temperature upon initialization or respawning
# TODO: Tweak this value for gameplay (ex. higher number to give "grace period" to respawning) Shouldn't be higher than a T1 heat source
scoreboard players set #warmth_default vin.player_meta 20