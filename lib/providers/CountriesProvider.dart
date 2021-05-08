import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/CountriesModel.dart';
import 'package:flutter_provider/utils/Countries.dart';

class CountriesProvider extends ChangeNotifier {
  List<Country> countries = [];
  bool isSearchMode = false;

  Future<void> retrieveCountries() async {
    if (isSearchMode == false) {
      if (countries.isNotEmpty) countries.clear();
      for (int i = 0; i < 156; i++) {
        countries.add(Country(codes[i], flagImgUrls[i], names[i]));
      }
    }
    notifyListeners();
  }

  void onSearchIconTap() {
    isSearchMode = true;
    notifyListeners();
  }

  void onCancelTap() {
    isSearchMode = false;
    notifyListeners();
  }

  void searchCountries(String query) {
    if (countries.isNotEmpty) countries.clear();
    for (int i = 0; i < 156; i++) {
      if (names[i].toLowerCase().contains(query.toLowerCase()) || query.toLowerCase() == codes[i].toLowerCase()) countries.add(Country(codes[i], flagImgUrls[i], names[i]));
    }
    notifyListeners();
  }
}
