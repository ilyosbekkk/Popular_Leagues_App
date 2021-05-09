import 'package:flutter_provider/models/CountriesModel.dart';
import 'package:flutter_provider/utils/Strings_English.dart';

//players
class PlayersModel {
  String get = "";
  int results = 0;
  Paging paging = new Paging(current: -1, total: -1);
  List<Response> players;

  PlayersModel(this.get, this.results, this.paging, this.players);

  factory PlayersModel.fromJson(Map<String, dynamic> parsedJson) {
    var playerList = parsedJson["response"] as List;
    List<Response> players = playerList.map((e) => Response.fromJson(e)).toList();

    return PlayersModel(parsedJson["get"], parsedJson["results"], Paging.fromJson(parsedJson["paging"]), players);
  }
}

//region Individual player
class Player {
  int? id;
  String? name;
  String? firstname;
  String? lastname;
  int? age = 0;
  PlayerBirth? playerBirth;
  String? nationality;
  String? height;
  String? weight;
  String? photo_url;

  Player({this.id, this.name, this.firstname, this.lastname, this.age, this.nationality, this.height, this.weight, this.photo_url});

  factory Player.fromJson(Map<String, dynamic> parsedJson) {

    return Player(
        id: parsedJson["id"] != null ? parsedJson["id"] : -1,
        name: parsedJson["name"] != null ? parsedJson["name"] : "unknown",
        firstname: parsedJson["firstname"] != null ? parsedJson["firstname"] : "unknown",
        lastname: parsedJson["lastname"] != null ? parsedJson["lastname"] : "unknown",
        age: parsedJson["age"] != null ? parsedJson["age"] : "unknown",
        nationality: parsedJson["nationality"] != null ? parsedJson["nationality"] : "unknown",
        height: parsedJson["height"] != null ? parsedJson["height"] : "unknwon",
        weight: parsedJson["weight"] != null ? parsedJson["weight"] : "unknown",
        photo_url: parsedJson["photo"] != null ? parsedJson["photo"] : Strings.no_image_png,
      );
  }
}

class Response {
  late Player player;

  Response(this.player);

  factory Response.fromJson(Map<String, dynamic> parsedJson) {
    return Response(Player.fromJson(parsedJson["player"]));
  }
}

class PlayerBirth {
  String? date;
  String? place;
  String? country;

  PlayerBirth(this.date, this.place, this.country);

  factory PlayerBirth.fromJson(Map<String, dynamic> parsedJson) {
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
