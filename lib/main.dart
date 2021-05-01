import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/CountriesProvider.dart';
import 'package:flutter_provider/providers/LeaguesProvider.dart';
import 'package:flutter_provider/ui/HomeScreen.dart';
import 'package:flutter_provider/ui/LeaguesScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CountriesProvider(),
      ),
      ChangeNotifierProvider(create: (_) => LeaguesProvider())
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
      initialRoute: MyHomePage.route,
      routes: {MyHomePage.route: (_) => MyHomePage(), LeaguesScreen.route: (_) => LeaguesScreen()},
    );
  }
}
