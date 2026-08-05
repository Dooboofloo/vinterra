# vinterra:world/snow/accumulation/interact
# Must be executed at a snow-interactable block

# In the future we may consider things such as campfires,
# candles, etc. being snuffed out or other interactions
# 
# Snow-charged creepers??

# Ice and packed ice have a chance to be promoted
execute if block ~ ~ ~ #vinterra:snow/interactable/pack run return run function vinterra:world/snow/accumulation/interact/pack

return 0