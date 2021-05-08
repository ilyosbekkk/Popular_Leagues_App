import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/LeaguesProvider.dart';
import 'package:flutter_provider/ui/bottomsheets/FixturesBottomSheet.dart';
import 'package:flutter_provider/ui/bottomsheets/PlayersBottomSheet.dart';
import 'package:flutter_provider/ui/bottomsheets/StandingsBottomSheet.dart';
import 'package:flutter_provider/utils/Strings_English.dart';
import 'package:provider/provider.dart';

class LeaguesScreen extends StatelessWidget {
  static String route = "/leagues";
  late double height;
  late double width;
  late Map<String, String> country;
  var leagueProvider;

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;
    country = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(country);
    leagueProvider = Provider.of<LeaguesProvider>(context, listen: false);
    leagueProvider.retrieveLeagues(country.values.first);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(Strings.leagues),
      ),
      body: Center(child: Consumer<LeaguesProvider>(builder: (context, leaguesProvider, child) {
        return !leaguesProvider.isLoading
            ? ListView.builder(
                itemCount: leaguesProvider.leagues.length,
                itemBuilder: (context, index) {
                  return _buildLeagueWidget(leaguesProvider.leagues[index].league.name, leaguesProvider.leagues[index].league.logoUrl,  leaguesProvider.leagues[index].league.id, context);
                })
            : CircularProgressIndicator();
      })),
    );
  }

  Widget _buildLeagueWidget(String league_name, String league_logo, int  id, BuildContext context) {
    double card_height = height * 0.2;
    double card_width = width;
    return Container(
      height: card_height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.yellow,
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    league_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: card_height * 0.3,
                  width: card_width * 0.1,
                  child: CachedNetworkImage(imageUrl: league_logo),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    _onFixturesButtonPressed(context, id);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textColor: Colors.white,
                  child: Text("Fixtures"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    _onPlayersButtonPressed(context,  id);
                  },
                  child: Text("Players"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    _onStandingsButtonPressed(context,  id);
                  },
                  child: Text("Standings"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onFixturesButtonPressed(BuildContext context, int  id) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (_) => FixturesBottomSheet());
  }

  void _onPlayersButtonPressed(BuildContext context, int  id) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (_) => PlayersBottomSheet(id));
  }

  void _onStandingsButtonPressed(BuildContext context, int  id) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (_) => StandingsBottomSheet());
  }
}
