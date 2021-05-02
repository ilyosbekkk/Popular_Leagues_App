import 'package:flutter_provider/utils/Strings.dart';

class CountriesModel {
  String get = "";
  Paging paging = Paging(current: 0, total: 0);
  int results = 0;
  List<Country>? response;

  CountriesModel({required String get, required Paging paging, required int results, required List<Country> countries}) {
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
  int current = 0;
  int total = 0;

  Paging({required int current, required int total}) {
    this.current = current;
    this.total = total;
  }

  factory Paging.fromJson(Map<String, dynamic> parsedJson) {
    return Paging(current: parsedJson["current"], total: parsedJson["total"]);
  }
}

class Country {
  String code = "";
  String flagImageUrl = "";
  String name = "";

  Country( String code,  String flagImageUrl,  String name) {
    this.code = code;
    this.flagImageUrl = flagImageUrl;
    this.name = name;
  }

  String get countryCode => code;

  String get countryFlagImageUrl => flagImageUrl;

  String get countryName => name;

  factory Country.fromJson(Map<String, dynamic> countryJson) {
    if (countryJson["code"] != null && countryJson["flag"] != null && countryJson["name"] != null)
      return Country(countryJson["code"], countryJson["flag"], countryJson["name"]);
    else {
      return Country( "unknown",  Strings.no_image,"unknown");
    }
  }

}
