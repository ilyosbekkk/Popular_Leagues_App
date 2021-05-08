import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/LeaguesModel.dart';
import 'package:flutter_provider/utils/Strings_English.dart';
import 'package:http/http.dart' as http;

class LeaguesProvider extends ChangeNotifier {
  List<Response> leagues = [];
  bool isLoading = true;

  Future<void> retrieveLeagues(String countryCode) async {
    var url = Uri.parse("${Strings.url}/leagues?code=${countryCode}");
    Map<String, String> headers = {Strings.apiKey2.keys.single: Strings.apiKey2.values.single, Strings.hostUrl.keys.single: Strings.hostUrl.values.single};
    http.Response response = await http.get(url, headers: headers);
    final jsonResponse = json.decode(response.body);
    print(response.body);
    LeaguesModel leaguesModel = new LeaguesModel.fromJson(jsonResponse);

   if(leagues.isNotEmpty)
     leagues.clear();
    leagues.addAll(leaguesModel.leagues);

    isLoading = false;
    notifyListeners();
  }



}
