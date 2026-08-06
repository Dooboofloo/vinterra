# vinterra:debug/profile/start_macro
# Must be executed as and at the recording player
#
# Arguments:
# - test_id:<str> | An identifier for this test
# - build:<str> | The build of Vinterra this test uses
# - time:<int> | Vinterra time
# - weather:<int> | Weather state (0 = Clear, 1 = Snowfall, 2 = Blizzard)
# - effective_warmth:<int> | Starting Effective Warmth
# - wetness:<int> | Starting Wetness
# - cold_exposure:<int> | Starting Cold Exposure
# - comfort:<int> | Starting Comfort (will be immediately recalculated unless locked)

# Only one profile may use the global recorder at a time
execute if entity @a[tag=vin.debug_profile_active] run tellraw @s {text:"A debug profile is already active.",color:"red"}
execute if entity @a[tag=vin.debug_profile_active] run return 0
execute if data storage vinterra:debug profile.active run tellraw @s {text:"Stale profile storage exists. Cancel it before starting another profile.",color:"red"}
execute if data storage vinterra:debug profile.active run return 0

## Enable debug viewing
tag @s add vin.debug_viewer

## Freeze world state progression
scoreboard players set #advance_time vin.time_meta 0
scoreboard players set #advance_weather vin.weather 0

## Set and sync world state
$function vinterra:debug/time/set/value_macro {value:$(time)}

$scoreboard players set #state vin.weather $(weather)
execute unless score #state vin.weather matches 0..2 run scoreboard players set #state vin.weather 0
scoreboard players set #timer vin.weather 0
function vinterra:world/weather/apply_current

## Set player state

# Set and clamp Wetness
$scoreboard players set @s vin.wetness $(wetness)
execute if score @s vin.wetness matches ..-1 run scoreboard players set @s vin.wetness 0
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta

# Set and clamp Comfort
$scoreboard players set @s vin.comfort $(comfort)
execute if score @s vin.comfort matches ..-1 run scoreboard players set @s vin.comfort 0
execute if score @s vin.comfort > #comfort_max vin.comfort_meta run scoreboard players operation @s vin.comfort = #comfort_max vin.comfort_meta

# Set, classify, and apply Cold Exposure
$scoreboard players set @s vin.cold_exposure $(cold_exposure)
function vinterra:survival/warmth/cold_exposure/update_stage
function vinterra:player/health/max_health/apply_cold_exposure
scoreboard players set @s vin.cold_dmg_timer 0

# Disable initialization grace
scoreboard players set @s vin.player_grace_counter 0

# Calculate the real target and all component values immediately
execute at @s run function vinterra:survival/recalc

# The synchronous calculation fulfills any previous urgent request
tag @s remove vin.recalc_urgent
scoreboard players set @s vin.recalc_wait 0

# Seed Effective Warmth independently of the calculated target
$scoreboard players set @s vin.warmth_effective $(effective_warmth)
function vinterra:survival/warmth/band/initialize

# Begin timed measurements consistently
scoreboard players set #interpolate_clock vin.warmth_meta 0
scoreboard players set #exposure_clock vin.warmth_meta 0


## Begin profile timer and reports
scoreboard players set @s vin.debug_profile_timer 0
tag @s add vin.debug_profile_active

# Initialize report state
$data modify storage vinterra:debug profile.active set value {test_id:"$(test_id)",build:"$(build)",setup:{time:$(time),weather:$(weather),effective_warmth:$(effective_warmth),wetness:$(wetness),cold_exposure:$(cold_exposure),comfort:$(comfort)},locks:{wetness:0b,warmth:0b,exposure:0b,comfort:0b},samples:[]}
data modify storage vinterra:debug profile.active.player_uuid set from entity @s UUID
data modify storage vinterra:debug profile.active.position set from entity @s Pos
data modify storage vinterra:debug profile.active.dimension set from entity @s Dimension
execute if entity @s[tag=vin.test_lock_wetness] run data modify storage vinterra:debug profile.active.locks.wetness set value 1b
execute if entity @s[tag=vin.test_lock_warmth] run data modify storage vinterra:debug profile.active.locks.warmth set value 1b
execute if entity @s[tag=vin.test_lock_exposure] run data modify storage vinterra:debug profile.active.locks.exposure set value 1b
execute if entity @s[tag=vin.test_lock_comfort] run data modify storage vinterra:debug profile.active.locks.comfort set value 1b

# Report Immediately
function vinterra:debug/profile/report

return 1