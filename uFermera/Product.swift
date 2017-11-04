import SwiftyJSON

let units = ["0": "кг.", "1": "литр", "2": "шт."]

let currencies = [
    "AF": "AFN",
    "AX": "EUR",
    "AL": "ALL",
    "DZ": "DZD",
    "AS": "USD",
    "AD": "EUR",
    "AO": "AOA",
    "AI": "XCD",
    "AG": "XCD",
    "AR": "ARS",
    "AM": "AMD",
    "AW": "AWG",
    "AU": "AUD",
    "AT": "EUR",
    "AZ": "AZN",
    "BS": "BSD",
    "BH": "BHD",
    "BD": "BDT",
    "BB": "BBD",
    "BY": "руб.", // "BYR",
    "BE": "EUR",
    "BZ": "BZD",
    "BJ": "XOF",
    "BM": "BMD",
    "BT": "BTN",
    "BO": "BOB",
    "BQ": "USD",
    "BA": "BAM",
    "BW": "BWP",
    "BV": "NOK",
    "BR": "BRL",
    "IO": "USD",
    "VG": "USD",
    "BN": "BND",
    "BG": "лев.", // "BGN",
    "BF": "XOF",
    "BI": "BIF",
    "KH": "KHR",
    "CM": "XAF",
    "CA": "CAD",
    "CV": "CVE",
    "KY": "KYD",
    "CF": "XAF",
    "TD": "XAF",
    "CL": "CLF",
    "CN": "CNY",
    "CX": "AUD",
    "CC": "AUD",
    "CO": "COP",
    "KM": "KMF",
    "CG": "XAF",
    "CD": "CDF",
    "CK": "NZD",
    "CR": "CRC",
    "HR": "HRK",
    "CU": "CUC",
    "CW": "ANG",
    "CY": "EUR",
    "CZ": "CZK",
    "DK": "DKK",
    "DJ": "DJF",
    "DM": "XCD",
    "DO": "DOP",
    "EC": "USD",
    "EG": "L.E.", // "EGP",
    "SV": "SVC",
    "GQ": "XAF",
    "ER": "ERN",
    "EE": "EUR",
    "ET": "ETB",
    "FK": "FKP",
    "FO": "DKK",
    "FJ": "FJD",
    "FI": "EUR",
    "FR": "EUR",
    "GF": "EUR",
    "PF": "XPF",
    "TF": "EUR",
    "GA": "XAF",
    "GM": "GMD",
    "GE": "GEL",
    "DE": "EUR",
    "GH": "GHS",
    "GI": "GIP",
    "GR": "EUR",
    "GL": "DKK",
    "GD": "XCD",
    "GP": "EUR",
    "GU": "USD",
    "GT": "GTQ",
    "GG": "GBP",
    "GN": "GNF",
    "GW": "XOF",
    "GY": "GYD",
    "HT": "HTG",
    "HM": "AUD",
    "VA": "EUR",
    "HN": "HNL",
    "HK": "HKD",
    "HU": "HUF",
    "IS": "ISK",
    "IN": "INR",
    "ID": "IDR",
    "CI": "XOF",
    "IR": "IRR",
    "IQ": "IQD",
    "IE": "EUR",
    "IM": "GBP",
    "IL": "ILS",
    "IT": "EUR",
    "JM": "JMD",
    "JP": "JPY",
    "JE": "GBP",
    "JO": "JOD",
    "KZ": "тнг.", // "KZT",
    "KE": "KES",
    "KI": "AUD",
    "KW": "KWD",
    "KG": "сом.", // "KGS",
    "LA": "LAK",
    "LV": "EUR",
    "LB": "LBP",
    "LS": "LSL",
    "LR": "LRD",
    "LY": "LYD",
    "LI": "CHF",
    "LT": "LTL",
    "LU": "EUR",
    "MO": "MOP",
    "MK": "MKD",
    "MG": "MGA",
    "MW": "MWK",
    "MY": "MYR",
    "MV": "MVR",
    "ML": "XOF",
    "MT": "EUR",
    "MH": "USD",
    "MQ": "EUR",
    "MR": "MRO",
    "MU": "MUR",
    "YT": "EUR",
    "MX": "MXN",
    "FM": "USD",
    "MD": "MDL",
    "MC": "EUR",
    "MN": "MNT",
    "ME": "евро", //"EUR",
    "MS": "XCD",
    "MA": "MAD",
    "MZ": "MZN",
    "MM": "MMK",
    "NA": "NAD",
    "NR": "AUD",
    "NP": "NPR",
    "NL": "EUR",
    "NC": "XPF",
    "NZ": "NZD",
    "NI": "NIO",
    "NE": "XOF",
    "NG": "NGN",
    "NU": "NZD",
    "NF": "AUD",
    "KP": "KPW",
    "MP": "USD",
    "NO": "NOK",
    "OM": "OMR",
    "PK": "PKR",
    "PW": "USD",
    "PS": "ILS",
    "PA": "PAB",
    "PG": "PGK",
    "PY": "PYG",
    "PE": "PEN",
    "PH": "PHP",
    "PN": "NZD",
    "PL": "PLN",
    "PT": "EUR",
    "PR": "USD",
    "QA": "QAR",
    "XK": "EUR",
    "RE": "EUR",
    "RO": "RON",
    "RU": "руб.", // "RUR",
    "RW": "RWF",
    "BL": "EUR",
    "SH": "SHP",
    "KN": "XCD",
    "LC": "XCD",
    "MF": "EUR",
    "PM": "EUR",
    "VC": "XCD",
    "WS": "WST",
    "SM": "EUR",
    "ST": "STD",
    "SA": "SAR",
    "SN": "XOF",
    "RS": "RSD",
    "SC": "SCR",
    "SL": "SLL",
    "SG": "SGD",
    "SX": "ANG",
    "SK": "EUR",
    "SI": "EUR",
    "SB": "SDB",
    "SO": "SOS",
    "ZA": "ZAR",
    "GS": "GBP",
    "KR": "KRW",
    "SS": "SSP",
    "ES": "евро", // "EUR",
    "LK": "LKR",
    "SD": "SDG",
    "SR": "SRD",
    "SJ": "NOK",
    "SZ": "SZL",
    "SE": "SEK",
    "CH": "CHE",
    "SY": "SYP",
    "TW": "TWD",
    "TJ": "TJS",
    "TZ": "TZS",
    "TH": "THB",
    "TL": "USD",
    "TG": "XOF",
    "TK": "NZD",
    "TO": "TOP",
    "TT": "TTD",
    "TN": "TND",
    "TR": "TRY",
    "TM": "TMT",
    "TC": "USD",
    "TV": "AUD",
    "UG": "UGX",
    "UA": "грн.", // "UAH",
    "AE": "AED",
    "GB": "GBP",
    "US": "USD",
    "UM": "USD",
    "VI": "USD",
    "UY": "UYI",
    "UZ": "UZS",
    "VU": "VUV",
    "VE": "VEF",
    "VN": "VND",
    "WF": "XPF",
    "EH": "MAD",
    "YE": "YER",
    "ZM": "ZMK",
    "ZW": "ZWL",
    "default" : "с.u."
]

class Product {
    
    let name: String
    let price: String!
    let description: String
    let location: String
    let unit: String!
    let currency: String!
    let countryCode: String
    let thumbnailPhotoURL: String?
    let fullsizePhotoURL: String?
    
    init(json: JSON) throws {
        name = json["name"].string!
        thumbnailPhotoURL = json["photo"]["thumbnail"].string
        price = json["price"].string
        description = json["description"].string!
        location = json["farm"]["address"].string!
        countryCode = json["farm"]["country_code"].string!
        unit = units[json["unit"].string!]
        currency = currencies[countryCode]
        fullsizePhotoURL = json["photo"]["fullsize"].string
    }
}