class Country {
  String code;
  String flagImageUrl;
  String name;

  Country({String code, String flagImageUrl, String name}) {
    this.code = code;
    this.flagImageUrl = flagImageUrl;
    this.name = name;
  }

  String get countryCode => code;

  String get countryFlagImageUrl => flagImageUrl;

  String get countryName => name;

  factory Country.fromJson(Map<String, dynamic> countryJson) {
    return Country(code: countryJson["code"], flagImageUrl: countryJson["flag"], name: countryJson["name"]);
  }
}
