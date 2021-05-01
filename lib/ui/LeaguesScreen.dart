import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/LeaguesProvider.dart';
import 'package:provider/provider.dart';

class LeaguesScreen extends StatelessWidget {
  static String route = "/leagues";
  late double height;
  late double width;
  late Map<String, String> countryCode;
  var leagueProvider;

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;
    countryCode = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(countryCode);
    leagueProvider = Provider.of<LeaguesProvider>(context, listen: false);

    leagueProvider.retrieveLeagues(countryCode["code"]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Leagues"),
      ),
      body: Center(child: Consumer<LeaguesProvider>(builder: (context, leaguesProvider, child) {
        return !leaguesProvider.isLoading ? _buildLeagueWidget() : CircularProgressIndicator();
      })),
    );
  }

  Widget _buildLeagueWidget() {
    return Container();
  }
}
