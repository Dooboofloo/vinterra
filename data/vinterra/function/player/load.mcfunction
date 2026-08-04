# vinterra:player/load
# Load entry point for the player module. Calls each submodule's load function

# Player module helpers
scoreboard objectives add vin.player_meta dummy

# Detect respawns
scoreboard objectives add vin.player_respawn minecraft.custom:time_since_death

# Grace period for initialized and respawning players (15s)
scoreboard objectives add vin.player_grace_counter dummy
scoreboard players set #warmth_grace_period vin.player_meta 300

# A player's inherent body temperature upon initialization or respawning
# Cannot drop below this during grace period
scoreboard players set #warmth_default vin.player_meta 20