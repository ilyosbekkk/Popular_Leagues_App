import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/CountryProvider.dart';
import 'package:provider/provider.dart';

import 'screens/HomeScreen.dart';

void main() {
  int number = 0;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NetworkProvider("No data available"),
        child: MyApp(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test  Title',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}
