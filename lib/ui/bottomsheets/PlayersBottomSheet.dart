import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/PlayersModel.dart';
import 'package:flutter_provider/providers/PlayersProvider.dart';
import 'package:flutter_provider/utils/Strings_English.dart';
import 'package:provider/provider.dart';

class PlayersBottomSheet extends StatelessWidget {
  late int id;
  var playersProvider;

  PlayersBottomSheet(this.id);

  @override
  Widget build(BuildContext context) {
    playersProvider = Provider.of<PlayersProvider>(context, listen: false);
    double statusBarHeight = MediaQuery.of(context).padding.top;

    print(id);
    playersProvider.retrievePlayers(id);
    return Scaffold(

      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: statusBarHeight),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           icon: Icon(Icons.arrow_back),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           }),
          //       Container(
          //         child: Text(Strings.players_title, style: TextStyle(
          //           fontSize: 20,
          //           color: Colors.blue
          //         ),),
          //       ),
          //     ],
          //   ),
          // ),
          Consumer<PlayersProvider>(builder: (context, playersProvider, child) {
            return playersProvider.isLoading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: playersProvider.players.length,
                        itemBuilder: (context, index) {
                          return _buildPlayerCardView(playersProvider.players[index]);
                        }),
                  );
          })
        ],
      ),
    );
  }

  Widget _buildPlayerCardView(Response player) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: player.player.photo_url!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(Strings.player_name), Text(player.player.name!)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(Strings.player_age), Text("${player.player.age}")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(Strings.player_nationality), Text(player.player.nationality!)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(Strings.player_height), Text(player.player.height!)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(Strings.player_weight), Text(player.player.weight!)],
          ),
        ],
      ),
    );
  }
}

/*


 */
