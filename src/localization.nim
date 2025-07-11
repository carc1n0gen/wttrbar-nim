import tables

const supportedLanguages* = [
  "en", "de", "pl", "ru", "tr", "fr", "be", "zh", "es", "pt", "it", "ja", "uk", "sv"
]

const wttrSubdomains* = {
  "en": "wttr.in",
  "de": "de.wttr.in",
  "pl": "pl.wttr.in",
  "ru": "ru.wttr.in",
  "tr": "tr.wttr.in",
  "fr": "fr.wttr.in",
  "be": "be.wttr.in",
  "zh": "zh.wttr.in",
  "es": "es.wttr.in",
  "pt": "pt.wttr.in",
  "it": "it.wttr.in",
  "ja": "ja.wttr.in",
  "uk": "uk.wttr.in",
  "sv": "sv.wttr.in"
}.toTable

const translateObservationTime* = {
  "en": "Observed at",
  "de": "Beobachtet um",
  "pl": "Zaobserwowano o",
  "ru": "Наблюдается в",
  "tr": "Gözlemlendi",
  "fr": "Observé à",
  "be": "Назірана ў",
  "zh": "观察时间",
  "es": "Observado en",
  "pt": "Observado em",
  "it": "Osservato a",
  "ja": "で観察されました",
  "uk": "Спостерігається в",
  "sv": "Observerat vid"
}.toTable

const translateFeelsLike* = {
  "en": "Feels Like",
  "de": "Gefühlt wie",
  "pl": "Temperatura odczuwalna",
  "ru": "Ощущается как",
  "tr": "Hissedilen",
  "fr": "Ressenti",
  "be": "Адчуваецца як",
  "zh": "体感温度",
  "es": "Sensación térmica",
  "pt": "Sensação térmica",
  "it": "Sensazione Termica",
  "ja": "体感温度",
  "uk": "Відчувається як",
  "sv": "Känns som"
}.toTable

const translateHumidity* = {
  "en": "Humidity",
  "de": "Luftfeuchtigkeit",
  "pl": "Wilgotność",
  "ru": "Влажность",
  "tr": "Nem",
  "fr": "Humidité",
  "be": "Вільготнасць",
  "zh": "湿度",
  "es": "Humedad",
  "pt": "Umidade",
  "it": "Umidità",
  "ja": "湿度",
  "uk": "Вогкість",
  "sv": "Luftfuktighet"
}.toTable

const translateLocation* = {
  "en": "Location",
  "de": "Standort",
  "pl": "Lokalizacja",
  "ru": "Местоположение",
  "tr": "Konum",
  "fr": "Lieu",
  "be": "Месцазнаходжанне",
  "zh": "地区",
  "es": "Ubicación",
  "pt": "Localização",
  "it": "Posizione",
  "ja": "地点",
  "uk": "Розташування",
  "sv": "Plats"
}.toTable

const translateToday* = {
  "en": "Today",
  "de": "Heute",
  "pl": "Dzisiaj",
  "ru": "Сегодня",
  "tr": "Bugün",
  "fr": "Aujourd'hui",
  "be": "Сёння",
  "zh": "今日天气",
  "es": "Hoy",
  "pt": "Hoje",
  "it": "Oggi",
  "ja": "今日",
  "uk": "Сьогодні",
  "sv": "Idag"
}.toTable

const translateTomorrow* = {
  "en": "Tomorrow",
  "de": "Morgen",
  "pl": "Jutro",
  "ru": "Завтра",
  "tr": "Yarın",
  "fr": "Demain",
  "be": "Заўтра",
  "zh": "明日天气",
  "es": "Mañana",
  "pt": "Amanhã",
  "it": "Domani",
  "ja": "明日",
  "uk": "Завтра",
  "sv": "Imorgon"
}.toTable

const translateFog* = {
  "en": "Fog",
  "de": "Nebel",
  "pl": "Mgła",
  "ru": "Туман",
  "tr": "Sis",
  "fr": "Brouillard",
  "be": "Туман",
  "zh": "雾",
  "es": "Niebla",
  "pt": "Nevoeiro",
  "it": "Nebbia",
  "ja": "霧",
  "uk": "Туман",
  "sv": "Dimma"
}.toTable

const translateFrost* = {
  "en": "Frost",
  "de": "Frost",
  "pl": "Mróz",
  "ru": "Мороз",
  "tr": "Don",
  "fr": "Gel",
  "be": "Мароз",
  "zh": "霜",
  "es": "Escarcha",
  "pt": "Geada",
  "it": "Gelo",
  "ja": "霜",
  "uk": "Мороз",
  "sv": "Frost"
}.toTable

const translateOvercast* = {
  "en": "Overcast",
  "de": "Bewölkung",
  "pl": "Zachmurzenie",
  "ru": "Пасмурно",
  "tr": "Bulutlu",
  "fr": "Couvert",
  "be": "Хмурна",
  "zh": "多云",
  "es": "Nublado",
  "pt": "Nublado",
  "it": "Nuvoloso",
  "ja": "曇り",
  "uk": "Похмуро",
  "sv": "Mulet"
}.toTable

const translateRain* = {
  "en": "Rain",
  "de": "Regen",
  "pl": "Deszcz",
  "ru": "Дождь",
  "tr": "Yağmur",
  "fr": "Pluie",
  "be": "Дождж",
  "zh": "雨",
  "es": "Lluvia",
  "pt": "Chuva",
  "it": "Pioggia",
  "ja": "雨",
  "uk": "Дощ",
  "sv": "Regn"
}.toTable

const translateSnow* = {
  "en": "Snow",
  "de": "Schnee",
  "pl": "Śnieg",
  "ru": "Снег",
  "tr": "Kar",
  "fr": "Neige",
  "be": "Снег",
  "zh": "雪",
  "es": "Nieve",
  "pt": "Neve",
  "it": "Neve",
  "ja": "雪",
  "uk": "Сніг",
  "sv": "Snö"
}.toTable

const translateSunshine* = {
  "en": "Sunshine",
  "de": "Sonnenschein",
  "pl": "Nasłonecznienie",
  "ru": "Солнечно",
  "tr": "Güneş ışığı",
  "fr": "Ensoleillé",
  "be": "Сонечна",
  "zh": "晴",
  "es": "Soleado",
  "pt": "Sol",
  "it": "Sole",
  "ja": "晴れ",
  "uk": "Сонячно",
  "sv": "Solsken"
}.toTable

const translateThunder* = {
  "en": "Thunder",
  "de": "Donner",
  "pl": "Burza",
  "ru": "Гроза",
  "tr": "Gök gürültüsü",
  "fr": "Orages",
  "be": "Навальніца",
  "zh": "雷暴",
  "es": "Tormenta",
  "pt": "Trovão",
  "it": "Tuono",
  "ja": "雷",
  "uk": "Гроза",
  "sv": "Åska"
}.toTable

const translateWind* = {
  "en": "Wind",
  "de": "Wind",
  "pl": "Wiatr",
  "ru": "Ветер",
  "tr": "Rüzgar",
  "fr": "Vent",
  "be": "Вецер",
  "zh": "风速",
  "es": "Viento",
  "pt": "Vento",
  "it": "Vento",
  "ja": "風速",
  "uk": "Вітер",
  "sv": "Vind"
}.toTable

const translateWeatherDesc* = {
  "en": "weatherDesc",
  "de": "lang_de",
  "pl": "lang_pl",
  "ru": "lang_ru",
  "tr": "lang_tr",
  "fr": "lang_fr",
  "be": "lang_be",
  "zh": "lang_zh",
  "es": "lang_es",
  "pt": "lang_pt",
  "it": "lang_it",
  "ja": "lang_ja",
  "uk": "lang_uk",
  "sv": "lang_sv"
}.toTable

const translateLocale* = {
  "en": "en_US",
  "de": "de_DE",
  "pl": "pl_PL",
  "ru": "ru_RU",
  "tr": "tr_TR",
  "fr": "fr_FR",
  "be": "be_BY",
  "zh": "zh_CN",
  "es": "es_ES",
  "pt": "pt_PT",
  "it": "it_IT",
  "ja": "ja_JP",
  "uk": "uk_UA",
  "sv": "sv_SE"
}.toTable
