

import 'package:flutter/foundation.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:http/http.dart' as http;

class NetworkProvider extends ChangeNotifier {
  String text;
  bool isLoading = false;

  NetworkProvider(String text) {
    this.text = text;
  }

  Future<NetworkProvider> getData() async {
    var url = Uri.parse("${Strings.url}/countries");
    Map<String, String> headers = {Strings.apiKey.keys.single: Strings.apiKey.values.single, Strings.hostUrl.keys.single: Strings.hostUrl.values.single};
    http.Response response = await http.get(url, headers: headers);
    text = response.body;
    isLoading = false;
    print(text);
    notifyListeners();
  }

  void networkButtonPressed() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
