import parseopt

from localization import Lang, toLang

proc parseArgs*(): tuple = 
    var mainIndicator: string = "temp_C"
    var customIndicator: string = ""
    var location: string = ""
    var verticalView: bool = false
    var nerdIcons: bool = false
    var fahrenheit: bool = false
    var mph: bool = false
    var lang: Lang = toLang("en")

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

            of "nerd":
                nerdIcons = true

            of "fahrenheit":
                fahrenheit = true

            of "mph":
                mph = true

            of "lang":
                lang = toLang(value)

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
        nerdIcons: nerdIcons,
        fahrenheit: fahrenheit,
        mph: mph,
        lang: lang
    )