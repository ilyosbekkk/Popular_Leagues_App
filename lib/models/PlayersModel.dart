import 'package:flutter_provider/models/CountriesModel.dart';

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

    return PlayersModel(parsedJson["get"], parsedJson["results"], Paging.fromJson(parsedJson["paging"]),  players);
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

  Player(this.id, this.name, this.firstname, this.lastname, this.age, this.nationality, this.height, this.weight, this.photo_url);

  factory Player.fromJson(Map<String, dynamic> parsedJson) {

    if(parsedJson["id"]!= null && parsedJson["name"] != null && parsedJson["firstname"] != null && parsedJson["lastname"] != null && parsedJson["age"] != null && parsedJson["nationality"] != null
     && parsedJson["height"] != null && parsedJson["weight"] != null && parsedJson["photo"] != null
    )
    return Player(
      parsedJson["id"],
      parsedJson["name"],
      parsedJson["firstname"],
      parsedJson["lastname"],
      parsedJson["age"],
      parsedJson["nationality"],
      parsedJson["height"],
      parsedJson["weight"],
      parsedJson["photo"],
    );

    else  {
      return Player(-1, "unknown", "unknown", "unknown", -1, "unknown", "unknown", "unknown", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freeiconspng.com%2Fimg%2F23483&psig=AOvVaw1VziwZwxjgHct4BjiJot92&ust=1620625826564000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPCX3ejzu_ACFQAAAAAdAAAAABAD");
    }

  }
}

class Response {
  late Player player;

  Response(this.player);


  factory Response.fromJson(Map<String,  dynamic> parsedJson){
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
