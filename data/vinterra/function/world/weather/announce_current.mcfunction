# vinterra:world/weather/announce_current
# Announces the current weather after a state transition

execute if score #state vin.weather matches 0 run tellraw @a {text:"The sky begins to clear.",color:"gray",italic:true}
execute if score #state vin.weather matches 1 run tellraw @a {text:"Snow begins to fall.",color:"aqua",italic:true}
execute if score #state vin.weather matches 2 run tellraw @a {text:"A blizzard sweeps in.",color:"blue",bold:true}

return 1