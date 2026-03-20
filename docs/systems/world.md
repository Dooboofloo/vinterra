# Module: World

## Submodule: Time

A full day cycle in Vinterra is 1 hour (72000 ticks). Each phase of the day is not equal.
* Dawn (`66000..71999`) -- 5 minutes
* Day (`0..11999`) -- 10 minutes
* Dusk (`12000..17999`) -- 5 minutes
* Night (`18000..65999`) -- 40 minutes

Some notable times are:
* Start of Dawn: `66000`
* Start of Day: `0`
* Start of Dusk: `12000`
* Start of Night: `18000`

* Noon: `6000`
* Midnight: `42000`

### Debug Commands

#### `debug/set_time_macro`
* Sets time to a particular value in "vin time." The sky value is automatically calculated and updated.
* Usage: `/function vinterra:world/time/debug/set_time_macro {value:N}`

#### `debug/set_time_day`
* Sets time to the beginning of a minecraft day
* Usage: `/function vinterra:world/time/debug/set_time_day`

#### `debug/set_time_midnight`
* Sets time to midnight
* Usage: `/function vinterra:world/time/debug/set_time_midnight`

#### `debug/set_time_night`
* Sets time to the beginning of a minecraft night
* Usage: `/function vinterra:world/time/debug/set_time_night`

#### `debug/set_time_noon`
* Sets time to noon
* Usage: `/function vinterra:world/time/debug/set_time_noon`