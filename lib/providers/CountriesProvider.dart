import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/CountriesModel.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:http/http.dart' as http;

class CountriesProvider extends ChangeNotifier {
  List<Country> countries = [];
  bool isLoading  = true;

  Future<void> retrieveCountries() async {
    var url = Uri.parse("${Strings.url}/countries");
    Map<String, String> headers = {Strings.apiKey2.keys.single: Strings.apiKey2.values.single, Strings.hostUrl.keys.single: Strings.hostUrl.values.single};
    http.Response response = await http.get(url, headers: headers);
    final jsonResponse = json.decode(response.body);
    CountriesModel countriesModel = new CountriesModel.fromJson(jsonResponse);
    countries.addAll(countriesModel.response!);
    isLoading = false;
    notifyListeners();
  }

}
