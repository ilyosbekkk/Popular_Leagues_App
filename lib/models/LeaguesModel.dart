import 'package:flutter_provider/utils/Strings.dart';

class LeaguesModel {
  late String get = "";
  late int results = 0;
  late List<League> leagues = [];

  LeaguesModel({required String get, required int results, required List<League> leagues}) {
    this.get = get;
    this.results = results;
    this.leagues = leagues;
  }

  factory LeaguesModel.fromJson(Map<String, dynamic> parsedJson) {
    var leagues = parsedJson["response"] as List;
    List<League> leaguesList = leagues.map((e) => League.fromJson(e)).toList();
    return LeaguesModel(get: parsedJson["get"], results: parsedJson["results"], leagues: leaguesList);
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
    if (fromJson["id"] != null && fromJson["name"] != null && fromJson["type"] && fromJson["logo"] != null)
      return League(id: fromJson["id"], name: fromJson["name"], type: fromJson["type"], logoUrl: fromJson["logo"]);
    else
      return League(id: 0, name: "none", type: "none", logoUrl: Strings.no_image);
  }
}
