import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/NetworkProvider.dart';
import 'package:flutter_provider/providers/NumberProvider.dart';
import 'package:provider/provider.dart';

import 'MainScreen.dart';

void main() {
  int number = 0;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NumberModel(number),
      ),
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
