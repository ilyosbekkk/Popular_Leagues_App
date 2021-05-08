import 'package:flutter_provider/utils/Strings_English.dart';

class LeaguesModel {
  late String get = "";
  late int results = 0;
  late List<Response> leagues = [];

  LeaguesModel({required String get, required int results, required List<Response> leagues}) {
    this.get = get;
    this.results = results;
    this.leagues = leagues;
  }

  factory LeaguesModel.fromJson(Map<String, dynamic> parsedJson) {
    var leagues = parsedJson["response"] as List;
    List<Response> leaguesList = leagues.map((e) => Response.fromJson(e)).toList();
    return LeaguesModel(get: parsedJson["get"], results: parsedJson["results"], leagues: leaguesList);
  }
}

class Response {
  League league = new League(id: -1, name: "", type: "", logoUrl: "");
  HostCountry hostCountry = new HostCountry(code: "", flagImageUrl: "", name: "");

  Response(League league,  HostCountry hostCountry) {
    this.league = league;
    this.hostCountry = hostCountry;
  }


  factory Response.fromJson(Map<String  , dynamic> parsedJson){
    return Response(League.fromJson(parsedJson["league"]), HostCountry.fromJson(parsedJson["country"]));
  }
}

class HostCountry {
  String code = "";
  String flagImageUrl = "";
  String name = "";

  HostCountry({required String code, required String flagImageUrl, required String name}) {
    this.code = code;
    this.flagImageUrl = flagImageUrl;
    this.name = name;
  }

  String get countryCode => code;

  String get countryFlagImageUrl => flagImageUrl;

  String get countryName => name;

  factory HostCountry.fromJson(Map<String, dynamic> countryJson) {
    if (countryJson["code"] != null && countryJson["flag"] != null && countryJson["name"] != null)
      return HostCountry(code: countryJson["code"], flagImageUrl: countryJson["flag"], name: countryJson["name"]);
    else {
      return HostCountry(code: "unknown", flagImageUrl: Strings.no_image, name: "unknown");
    }
  }
}

class League {
  int id = 0;
  String name = "";
  String type = "";
  String logoUrl = "";

  League({required int id, required String name, required String type, required String logoUrl}) {
    this.id = id;
    this.name = name;
    this.type = type;
    this.logoUrl = logoUrl;
  }

  factory League.fromJson(Map<String, dynamic> fromJson) {
    if (fromJson["id"] != null && fromJson["name"] != null && fromJson["type"] != null && fromJson["logo"] != null)
      return League(id: fromJson["id"], name: fromJson["name"], type: fromJson["type"], logoUrl: fromJson["logo"]);
    else
      return League(id: 0, name: "none", type: "none", logoUrl: Strings.no_image);
  }
}
