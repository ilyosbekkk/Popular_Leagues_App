


class StandingsModel {
  String get = "";
  int results = -1;
  List<Response> response = [];

  StandingsModel({required this.get, required this.results, required this.response});




  factory StandingsModel.fromJson(Map<String,  dynamic> parsedJson) {
    var response= parsedJson["response"] as List;
    List<Response> reponses = response.map((e) => Response.fromJson(e)).toList();
    return StandingsModel(get: parsedJson["get"], results:parsedJson["results"], response: reponses);

  }
}

class Response {
  League league = League(id: -1, name: "", country: "", logo_url: "", flag_url: "", season: "", standingds: []);

  Response({required this.league});

  factory  Response.fromJson(Map<String,  dynamic> parsedJson){
    return Response(league: parsedJson["league"]);
  }


}

class Standing {
  List<Rank> ranks = [];

  Standing({required List<Rank> ranks});
}

class Rank {
  String rank = "";
  int points = -1;
  int goalsDiff = 47;
  String group = "";
  Team team = Team(id: -1, name: "", logo_url: "");
}

class GameStats {
  int played = -1;
  int win = -1;
  int draw = -1;
  int lose = -1;

  GameStats({required this.played, required this.win, required this.draw, required this.lose});
}

class Team {
  int id = -1;
  String name = "";
  String logo_url = "";

  Team({required this.id, required this.name, required this.logo_url});
}

class League {
  int id = -1;
  String name = "";
  String country = "";
  String logo_url = "";
  String flag_url = "";
  String season = "";
  List<Standing> standingds = [];

  League({required this.id, required this.name, required this.country, required this.logo_url, required this.flag_url, required this.season, required this.standingds});
}
