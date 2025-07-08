import os, times
import tables
import strformat
import httpclient
import json
import sequtils
import options
import strutils

from cli import parseArgs
from constants import WEATHER_CODES, WEATHER_CODES_NERD
import localization

echo """{"tooltip":"Loading...", "class":"loading", "text":"⏳"}"""

let args = parseArgs()
let lang = args.lang

var data = Table[string, string]()

let location = args.location
let weatherUrl = "https://$1/$2?format=j1".format(
    lang.wttrInSubdomain(),
    location
)

var attempts = 0
let maxAttempts = 20

let cacheFile = fmt"/tmp/wttrbar-$1-$2.json".format(
    location,
    lang.wttrInSubdomain()
)

let isCacheFileRecent = block:
  try:
    let info = getFileInfo(cacheFile)
    let tenMinutesAgo = getTime() - 10.minutes
    info.lastWriteTime > tenMinutesAgo
  except OSError:
    false

let weather = if isCacheFileRecent:
    let cacheContent = readFile(cacheFile)
    parseJson(cacheContent)
else:
    let client = newHttpClient()
    var result: JsonNode
    while true:
        try:
            let response = client.getContent(weatherUrl)
            try:
                result = parseJson(response)
                writeFile(cacheFile, response)
                break
            except JsonParsingError:
                echo """{"text":"⛓️‍💥", "tooltip":"invalid wttr.in response"}"""
                quit(0)
        except HttpRequestError, OSError, IOError:
            attempts += 1
            sleep(500 * attempts)
            
            if attempts == maxAttempts:
                echo """{"text":"⛓️‍💥", "tooltip":"cannot access wttr.in"}"""
                quit(0)

    client.close()
    result

let currentCondition = weather["current_condition"][0]
# let nearestAreas = weather["nearest_area"][0]
let feelsLIke = if args.fahrenheit:
    currentCondition["FeelsLikeF"].getStr()
else:
    currentCondition["FeelsLikeC"].getStr()

let weatherCode = currentCondition["weatherCode"].getStr()
let weatherIcon = (if args.nerdIcons: WEATHER_CODES_NERD else: WEATHER_CODES)
    .toSeq()
    .filterIt(it[0] == weatherCode.parseInt())
    .mapIt(it[1])
    .concat(@[if args.nerdIcons: "󰼸" else: "❓"])[0]  # Add fallback and take first

data["text"] = case args.customIndicator:
    of "":
        let mainIndicatorKey = if args.fahrenheit and args.mainIndicator == "temp_C":
            "temp_F"
        else:
            args.mainIndicator
        let indicator = currentCondition[mainIndicatorKey].getStr()
        if args.verticalView:
            fmt"{weatherIcon}\n{indicator}"
        else:
            fmt"{weatherIcon} {indicator}"
    else:
        "TODO: generate this from customIndicator"

let weatherDesc = currentCondition["weatherDesc"][0]["value"].getStr()

var tooltip = "<b>$1</b> $2°\n".format(
    currentCondition["weatherDesc"][0]["value"].getStr(),
    if args.fahrenheit: currentCondition["temp_F"].getStr() else: currentCondition["temp_C"].getStr()
)

tooltip.add("$1: $2°\n".format(
    lang.feelsLike(),
    feelsLIke
))

if args.mph:
    tooltip.add("$1: $2 mph\n".format(
        lang.wind(),
        currentCondition["windspeedMiles"].getStr()
    ))
else:
    tooltip.add("$1: $2 km/h\n".format(
        lang.wind(),
        currentCondition["windspeedKmph"].getStr()
    ))

tooltip.add("$1: $2\n".format(
    lang.humidity(),
    currentCondition["humidity"].getStr()
))

let nearestAreas = weather["nearest_area"][0]
tooltip.add("$1: $2, $3, $4".format(
    lang.location(),
    nearestAreas["areaName"][0]["value"].getStr(),
    nearestAreas["region"][0]["value"].getStr(),
    nearestAreas["country"][0]["value"].getStr()
))

# TODO: add observation time if the flag is true

# TODO: add forecast for today, tomorrow, and the day after

data["tooltip"] = tooltip

data["class"] = weatherDesc
    .toLowerAscii()
    .split(',')[0]
    .strip()
    .replace(" ", "_")

let jsonOutput = $(%data)
echo jsonOutput