class CountriesModel {
  String get;
  Paging paging;
  int results;
  List<Country> response;

  CountriesModel({String get, Paging paging, int results, List<Country> countries}) {
    this.get = get;
    this.paging = paging;
    this.results = results;
    this.response = countries;
  }

  factory CountriesModel.fromJson(Map<String, dynamic> parsedJson) {
    var countries = parsedJson["response"] as List;
    List<Country> countryList = countries.map((e) => Country.fromJson(e)).toList();

    return CountriesModel(get: parsedJson["get"], paging: Paging.fromJson(parsedJson["paging"]), results: parsedJson["results"], countries: countryList);
  }
}

class Paging {
  int current;
  int total;

  Paging({int current, int total}) {
    this.current = current;
    this.total = total;
  }

  factory Paging.fromJson(Map<String, dynamic> parsedJson) {
    return Paging(current: parsedJson["current"], total: parsedJson["total"]);
  }
}

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
