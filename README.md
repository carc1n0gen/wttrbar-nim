
## Installation
Compile yourself using `nimble build` and then run `nimble install` to install
it to `~/.nimble/bin`. This folder will need to be added to your path, or you
can symlink it somewhere that is in the path, or just reference it by absolute path.

## Usage

<!-- - `--ampm` - display time in AM/PM format -->
- `--location=STRING` - pass a specific location to wttr.in
- `--main-indicator=STRING` - decide which `current_conditions` [key](https://wttr.in/?format=j1) will be shown on waybar. defaults to temp_C
<!-- - `--date-format` = defaults to `%Y-%m-%d`, formats date next to the days. See [reference]() -->
- `--nerd` - Use nerd font symbols instead of emojis
<!-- - `--hide-conditions` - show a shorter descrpition next to each hour, like `7° Mist` instead of `7° Mist, Overcast 81%, Sunshine 17%, Frost 15%` -->
- `--fahrenheit` - use fahrenheit instead of celsius
- `--mph` - use mph instead of km/h for wind speed
<!-- - `--custom-indicator=STRING` - optional expression that will be shown instead of main indicator. [`current_conditions` and `nearesta_area` keys](https://wttr.in/?format=j1) surrounded by {} can be used. For example, `"{ICON} {FeelsLikeC} ({areaName})"` will be transformed in to `"text":"🌧️ -4 (Amsterdam)"` in the output -->
- `--lang=STRING` - set language (currently currently `en`, `de`, `pl`, `tr`, `fr`, `ru`, `zh`, `be`, `es`, `pt`, `it`, `ja`, `uk`, `sv`; submit a PR to add yours)
<!-- - `--observation-time` - show the time the current weather conditions were measured -->

## Waybar Configuration

Assuming wttrbar is in your path, it can be used like:

```json
"custom/weather": {
    "format": "{}°",
    "tooltip": true,
    "restart-interval": 3600,
    "exec": "wttrbar",
    "return-type": "json"
},
```

There is a small difference here compared to the original rust version that I
based this project on. The original uses `"interval"`, while I am using 
`"restart-interval"`. When using `"interval"` way bar will only expect a 
single line of output data. If you omit `"interval"` waybar will accept
multiple lines of data, but then we lose out on re-running to get  updated
data. Turns out there is `"restart-interval"` which is a sort of hybrid. It
makes waybar accept multiple lines of output, and restarts the script/binary
after a specific number of seconds.

The reason I care about waybar accepting multiple lines of data is so that I
can show a placeholder like "loading..." in waybar while the http request is
pending, or the case of PC waking from sleep and not immediately having an
internet connection, so wttrbar is making multiple http atempts while PC is
getting the internet connection back.

## Credits
This is a nim port of [wttrbar](https://github.com/bjesus/wttrbar) created by [bjesus](https://github.com/bjesus), with some improvements, and also missing parts (for now). I created this project as a way teach myself the basics of nim.
