
## Installation
Compile yourself using `nimble build` and then run `nimble install` to install
it to `~/.nimble/bin`. This folder will need to be added to your path, or you
can symlink it somewhere that is in the path.

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

## Credits
This is a nim port of [wttr](https://github.com/bjesus/wttrbar) created by [bjesus](ttps://github.com/bjesus). I created this project as a way teach myself the basics of nim.
