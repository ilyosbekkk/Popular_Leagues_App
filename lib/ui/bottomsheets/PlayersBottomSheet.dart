import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/PlayersProvider.dart';
import 'package:provider/provider.dart';

class PlayersBottomSheet extends StatelessWidget {
  late int id;
  var playersProvider;

  PlayersBottomSheet(this.id);

  @override
  Widget build(BuildContext context) {
    playersProvider = Provider.of<PlayersProvider>(context, listen: false);
    print(id);
    playersProvider.retrievePlayers(id);
    return SafeArea(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Consumer<PlayersProvider>(builder: (context, leaguesProvider, child) {
            return leaguesProvider.isLoading ? CircularProgressIndicator() : Text("done");
          })
        ],
      ),
    );
  }
}
