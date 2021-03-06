import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/CountriesProvider.dart';
import 'package:flutter_provider/providers/LeaguesProvider.dart';
import 'package:flutter_provider/providers/PlayersProvider.dart';
import 'package:flutter_provider/ui/screens/HomeScreen.dart';
import 'package:flutter_provider/ui/screens/LeaguesScreen.dart';
import 'package:provider/provider.dart';

import 'providers/StandingsProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CountriesProvider()),
      ChangeNotifierProvider(create: (_) => LeaguesProvider()),
      ChangeNotifierProvider(create: (_) => PlayersProvider()),
      ChangeNotifierProvider(create: (_) => StandingsProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test  Title',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MyHomePage.route,
      routes: {
        MyHomePage.route: (_) => MyHomePage(),
        LeaguesScreen.route: (_) => LeaguesScreen()
      },
    );
  }
}
