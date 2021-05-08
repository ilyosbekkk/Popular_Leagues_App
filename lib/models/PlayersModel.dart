import 'package:flutter_provider/models/CountriesModel.dart';

//players
class PlayersModel {
  String get = "";
  int results = 0;
  int league_id = -1;
  Paging paging = new Paging(current: -1, total: -1);
  List<Player>? players;

  PlayersModel(this.get, this.results, this.league_id, this.paging, this.players);


  factory PlayersModel.fromJson(Map<String, dynamic> parsedJson){
    var playerList = parsedJson["response"] as List;
    List<Player> players = playerList.map((e) => Player.fromJson(e)).toList();

    return PlayersModel(parsedJson["get"], parsedJson["results"], parsedJson["id"], Paging.fromJson(parsedJson["paging"]), players);
  }
}


//region Individual player
class Player {
  int id = -1;
  String name = "";
  String firstname = "";
  String lastname = "";
  int age = -1;
  late PlayerBirth playerBirth;
  String nationality = "";
  String height = "";
  String weight = "";
  bool injured = false;
  String photo_url = "";

  Player(this.id, this.name, this.firstname, this.lastname, this.age, this.playerBirth, this.nationality, this.height, this.weight, this.injured, this.photo_url);


  factory Player.fromJson(Map<String, dynamic> parsedJson){

    return Player(
      parsedJson["id"],
      parsedJson["name"],
      parsedJson["firstname"],
      parsedJson["lastname"],
      parsedJson["age"],
      PlayerBirth.fromJson(parsedJson["birth"]),
      parsedJson["nationality"],
      parsedJson["height"],
      parsedJson["weight"],
      parsedJson["injured"],
      parsedJson["photo"],
    );
  }
}

class PlayerBirth {
  String date = "";
  String place = "";
  String country = "";

  PlayerBirth(this.date, this.place, this.country);

  factory PlayerBirth.fromJson(Map<String, dynamic> parsedJson){
    return PlayerBirth(parsedJson["date"], parsedJson["place"], parsedJson["country"]);
  }
}


class Team {
  int id = -1;
  String name = "";
  String logo_url = "";

  Team(this.id, this.name, this.logo_url);
}
//endregion
