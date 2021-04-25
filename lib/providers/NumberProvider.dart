import 'package:flutter/foundation.dart';

class NumberModel extends ChangeNotifier {
  int number;

  NumberModel(int number) {
    this.number = number;
  }

  void increment() {
    number++;
    notifyListeners();
  }

  void decrement() {
    number--;
    notifyListeners();
  }
}
