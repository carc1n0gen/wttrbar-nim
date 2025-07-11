import parseopt

from localization import supportedLanguages

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