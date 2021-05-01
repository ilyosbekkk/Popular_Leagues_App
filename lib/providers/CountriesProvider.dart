import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/CountriesModel.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:http/http.dart' as http;

class NetworkProvider extends ChangeNotifier {
  String text;
  List<Country> countries = [];
  int  count = 0;
  bool isLoading = false;

  NetworkProvider(String text) {
    this.text = text;
  }

  Future<void> getData() async {
    var url = Uri.parse("${Strings.url}/countries");
    Map<String, String> headers = {Strings.apiKey.keys.single: Strings.apiKey.values.single, Strings.hostUrl.keys.single: Strings.hostUrl.values.single};
    http.Response response = await http.get(url, headers: headers);
    text = response.body;

    final jsonResponse = json.decode(text);
    CountriesModel countriesModel = new CountriesModel.fromJson(jsonResponse);

    count = countriesModel.results;
    countries.addAll(countriesModel.response);




    isLoading = false;
    notifyListeners();
  }

  void networkButtonPressed() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
