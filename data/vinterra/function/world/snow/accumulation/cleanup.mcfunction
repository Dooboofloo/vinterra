# vinterra:world/snow/accumulation/cleanup
# Removes all transient snow-accumulation state

kill @e[type=marker,tag=vin.snow_probe]
tag @a remove vin.snow_candidate

return 0