# vinterra:survival/warmth/block/heat/aggregate/cleanup
# Clears transient aggregation selection tags

tag @e[type=marker,tag=vin.heat_probe_aggregate_candidate] remove vin.heat_probe_aggregate_candidate
tag @e[type=marker,tag=vin.heat_probe_aggregate_current] remove vin.heat_probe_aggregate_current