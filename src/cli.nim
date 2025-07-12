import parseopt

from localization import supportedLanguages

proc printHelp() =
    echo """Usage: wttrbar [options]
Options:
  --main-indicator=<indicator>   Set the main weather indicator (default: temp_C)
  --custom-indicator=<indicator> Set a custom weather indicator
  --location=<location>          Specify the location for weather data
  --vertical-view                Use vertical view mode
  --ampm                         Use 12-hour format with AM/PM
  --nerd                         Use nerd icons for weather symbols
  --fahrenheit                   Use Fahrenheit for temperature
  --mph                          Use miles per hour for wind speed
  --lang=<language>              Set the language for output (default: en)
  --observation-time             Show the observation time of the weather data
  --help                         Show this help message"""

proc parseArgs*(): tuple = 
    var mainIndicator: string = "temp_C"
    var customIndicator: string = ""
    var location: string = ""
    var verticalView: bool = false
    var ampm: bool = false
    var nerdIcons: bool = false
    var fahrenheit: bool = false
    var mph: bool = false
    var lang: string = "en"
    var observationTime: bool = false

    for kind, key, value in getOpt():
        case kind
        of cmdLongOption:
            case key
            of "help":
                printHelp()
                quit(0)

            of "main-indicator":
                mainIndicator = value

            of "custom-indicator":
                customIndicator = value

            of "location":
                location = value

            of "vertical-view":
                verticalView = true

            of "ampm":
                ampm = true

            of "nerd":
                nerdIcons = true

            of "fahrenheit":
                fahrenheit = true

            of "mph":
                mph = true

            of "lang":
                if value notin supportedLanguages:
                    lang = "en"
                else:
                    lang = value.toLowerAscii()

            of "observation-time":
                observationTime = true

        of cmdEnd:
            discard

        else:
            # Ignore other command arg types
            continue

    return (
        mainIndicator: mainIndicator,
        customIndicator: customIndicator,
        location: location,
        verticalView: verticalView,
        ampm: ampm,
        nerdIcons: nerdIcons,
        fahrenheit: fahrenheit,
        mph: mph,
        lang: lang,
        observationTime: observationTime
    )