import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkProvider extends ChangeNotifier {
  String text;
  bool isLoading = false;

  NetworkProvider(String text) {
    this.text = text;
  }

  Future<NetworkProvider> getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    text = response.body.toString();
    isLoading = false;
    notifyListeners();
  }

  void networkButtonPressed() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
