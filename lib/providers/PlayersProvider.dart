import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/PlayersModel.dart';
import 'package:flutter_provider/utils/Strings_English.dart';
import 'package:http/http.dart' as http;


class  PlayersProvider extends ChangeNotifier{

  List<Response> players = [];
  bool isLoading = true;


  Future<void> retrievePlayers(int league_id)async {
    var url = Uri.parse("${Strings.url}players?league=$league_id&season=2020");
    Map<String, String> headers = {Strings.apiKey1.keys.single: Strings.apiKey1.values.single, Strings.hostUrl.keys.single: Strings.hostUrl.values.single};
    http.Response response = await http.get(url, headers: headers);
    final jsonResponse = json.decode(response.body);

    PlayersModel playersModel = new PlayersModel.fromJson(jsonResponse);

    if(players.isNotEmpty)
      players.clear();
    players.addAll(playersModel.players);

    print(players);
    isLoading = false;


    notifyListeners();

  }

  void markFavorite(){

  }
}