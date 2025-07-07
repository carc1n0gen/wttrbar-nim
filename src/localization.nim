import strutils

type
  Lang* = enum
    EN, DE, PL, RU, TR, FR, BE, ZH, ES, PT, IT, JA, UK, SV

# Convert string to Lang
proc toLang*(langStr: string): Lang =
  case langStr.toLower()
  of "en": EN
  of "de": DE  
  of "pl": PL
  of "ru": RU
  of "tr": TR
  of "fr": FR
  of "be": BE
  of "zh": ZH
  of "es": ES
  of "pt": PT
  of "it": IT
  of "ja": JA
  of "uk": UK
  of "sv": SV
  else: EN  # Default to EN if not recognized

# Methods directly on the enum type
proc wttrInSubdomain*(lang: Lang): string =
  case lang
  of EN: "wttr.in"
  of DE: "de.wttr.in"
  of PL: "pl.wttr.in"
  of RU: "ru.wttr.in"
  of TR: "tr.wttr.in"
  of FR: "fr.wttr.in"
  of BE: "be.wttr.in"
  of ZH: "zh.wttr.in"
  of ES: "es.wttr.in"
  of PT: "pt.wttr.in"
  of IT: "it.wttr.in"
  of JA: "ja.wttr.in"
  of UK: "uk.wttr.in"
  of SV: "sv.wttr.in"

proc observationTime*(lang: Lang): string =
  case lang
  of EN: "Observed at"
  of DE: "Beobachtet um"
  of PL: "Zaobserwowano o"
  of RU: "Наблюдается в"
  of TR: "Gözlemlendi"
  of FR: "Observé à"
  of BE: "Назірана ў"
  of ZH: "观察时间"
  of ES: "Observado en"
  of PT: "Observado em"
  of IT: "Osservato a"
  of JA: "で観察されました"
  of UK: "Спостерігається в"
  of SV: "Observerat vid"

proc feelsLike*(lang: Lang): string =
  case lang
  of EN: "Feels Like"
  of DE: "Gefühlt wie"
  of PL: "Temperatura odczuwalna"
  of RU: "Ощущается как"
  of TR: "Hissedilen"
  of FR: "Ressenti"
  of BE: "Адчуваецца як"
  of ZH: "体感温度"
  of ES: "Sensación térmica"
  of PT: "Sensação térmica"
  of IT: "Sensazione Termica"
  of JA: "体感温度"
  of UK: "Відчувається як"
  of SV: "Känns som"

proc humidity*(lang: Lang): string =
  case lang
  of EN: "Humidity"
  of DE: "Luftfeuchtigkeit"
  of PL: "Wilgotność"
  of RU: "Влажность"
  of TR: "Nem"
  of FR: "Humidité"
  of BE: "Вільготнасць"
  of ZH: "湿度"
  of ES: "Humedad"
  of PT: "Umidade"
  of IT: "Umidità"
  of JA: "湿度"
  of UK: "Вогкість"
  of SV: "Luftfuktighet"

proc location*(lang: Lang): string =
  case lang
  of EN: "Location"
  of DE: "Standort"
  of PL: "Lokalizacja"
  of RU: "Местоположение"
  of TR: "Konum"
  of FR: "Lieu"
  of BE: "Месцазнаходжанне"
  of ZH: "地区"
  of ES: "Ubicación"
  of PT: "Localização"
  of IT: "Posizione"
  of JA: "地点"
  of UK: "Розташування"
  of SV: "Plats"

proc today*(lang: Lang): string =
  case lang
  of EN: "Today"
  of DE: "Heute"
  of PL: "Dzisiaj"
  of RU: "Сегодня"
  of TR: "Bugün"
  of FR: "Aujourd'hui"
  of BE: "Сёння"
  of ZH: "今日天气"
  of ES: "Hoy"
  of PT: "Hoje"
  of IT: "Oggi"
  of JA: "今日"
  of UK: "Сьогодні"
  of SV: "Idag"

proc tomorrow*(lang: Lang): string =
  case lang
  of EN: "Tomorrow"
  of DE: "Morgen"
  of PL: "Jutro"
  of RU: "Завтра"
  of TR: "Yarın"
  of FR: "Demain"
  of BE: "Заўтра"
  of ZH: "明日天气"
  of ES: "Mañana"
  of PT: "Amanhã"
  of IT: "Domani"
  of JA: "明日"
  of UK: "Завтра"
  of SV: "Imorgon"

proc fog*(lang: Lang): string =
  case lang
  of EN: "Fog"
  of DE: "Nebel"
  of PL: "Mgła"
  of RU: "Туман"
  of TR: "Sis"
  of FR: "Brouillard"
  of BE: "Туман"
  of ZH: "雾"
  of ES: "Niebla"
  of PT: "Nevoeiro"
  of IT: "Nebbia"
  of JA: "霧"
  of UK: "Туман"
  of SV: "Dimma"

proc frost*(lang: Lang): string =
  case lang
  of EN: "Frost"
  of DE: "Frost"
  of PL: "Mróz"
  of RU: "Мороз"
  of TR: "Don"
  of FR: "Gel"
  of BE: "Мароз"
  of ZH: "霜"
  of ES: "Escarcha"
  of PT: "Geada"
  of IT: "Gelo"
  of JA: "霜"
  of UK: "Мороз"
  of SV: "Frost"

proc overcast*(lang: Lang): string =
  case lang
  of EN: "Overcast"
  of DE: "Bewölkung"
  of PL: "Zachmurzenie"
  of RU: "Пасмурно"
  of TR: "Bulutlu"
  of FR: "Couvert"
  of BE: "Хмурна"
  of ZH: "多云"
  of ES: "Nublado"
  of PT: "Nublado"
  of IT: "Nuvoloso"
  of JA: "曇り"
  of UK: "Похмуро"
  of SV: "Mulet"

proc rain*(lang: Lang): string =
  case lang
  of EN: "Rain"
  of DE: "Regen"
  of PL: "Deszcz"
  of RU: "Дождь"
  of TR: "Yağmur"
  of FR: "Pluie"
  of BE: "Дождж"
  of ZH: "雨"
  of ES: "Lluvia"
  of PT: "Chuva"
  of IT: "Pioggia"
  of JA: "雨"
  of UK: "Дощ"
  of SV: "Regn"

proc snow*(lang: Lang): string =
  case lang
  of EN: "Snow"
  of DE: "Schnee"
  of PL: "Śnieg"
  of RU: "Снег"
  of TR: "Kar"
  of FR: "Neige"
  of BE: "Снег"
  of ZH: "雪"
  of ES: "Nieve"
  of PT: "Neve"
  of IT: "Neve"
  of JA: "雪"
  of UK: "Сніг"
  of SV: "Snö"

proc sunshine*(lang: Lang): string =
  case lang
  of EN: "Sunshine"
  of DE: "Sonnenschein"
  of PL: "Nasłonecznienie"
  of RU: "Солнечно"
  of TR: "Güneş ışığı"
  of FR: "Ensoleillé"
  of BE: "Сонечна"
  of ZH: "晴"
  of ES: "Soleado"
  of PT: "Sol"
  of IT: "Sole"
  of JA: "晴れ"
  of UK: "Сонячно"
  of SV: "Solsken"

proc thunder*(lang: Lang): string =
  case lang
  of EN: "Thunder"
  of DE: "Donner"
  of PL: "Burza"
  of RU: "Гроза"
  of TR: "Gök gürültüsü"
  of FR: "Orages"
  of BE: "Навальніца"
  of ZH: "雷暴"
  of ES: "Tormenta"
  of PT: "Trovão"
  of IT: "Tuono"
  of JA: "雷"
  of UK: "Гроза"
  of SV: "Åska"

proc wind*(lang: Lang): string =
  case lang
  of EN: "Wind"
  of DE: "Wind"
  of PL: "Wiatr"
  of RU: "Ветер"
  of TR: "Rüzgar"
  of FR: "Vent"
  of BE: "Вецер"
  of ZH: "风速"
  of ES: "Viento"
  of PT: "Vento"
  of IT: "Vento"
  of JA: "風速"
  of UK: "Вітер"
  of SV: "Vind"

proc weatherDesc*(lang: Lang): string =
  case lang
  of EN: "weatherDesc"
  of DE: "lang_de"
  of PL: "lang_pl"
  of RU: "lang_ru"
  of TR: "lang_tr"
  of FR: "lang_fr"
  of BE: "lang_be"
  of ZH: "lang_zh"
  of ES: "lang_es"
  of PT: "lang_pt"
  of IT: "lang_it"
  of JA: "lang_ja"
  of UK: "lang_uk"
  of SV: "lang_sv"

proc localeStr*(lang: Lang): string =
  case lang
  of EN: "en_US"
  of DE: "de_DE"
  of PL: "pl_PL"
  of RU: "ru_RU"
  of TR: "tr_TR"
  of FR: "fr_FR"
  of BE: "be_BY"
  of ZH: "zh_CN"
  of ES: "es_ES"
  of PT: "pt_PT"
  of IT: "it_IT"
  of JA: "ja_JP"
  of UK: "uk_UA"
  of SV: "sv_SE"