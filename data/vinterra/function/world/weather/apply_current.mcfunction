# vinterra:world/weather/apply_current
# Synchronizes vanilla Overworld weather with the Vinterra weather state

execute in minecraft:overworld if score #state vin.weather matches 0 run weather clear
execute in minecraft:overworld if score #state vin.weather matches 1..2 run weather rain

return 1