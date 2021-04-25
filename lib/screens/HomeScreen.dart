import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/CountryProvider.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var networkProvider = Provider.of<NetworkProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.string_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NetworkProvider>(builder: (context, networkProvider, child) {
              if (networkProvider.isLoading)
                return CircularProgressIndicator();
              else
                return Text("Done!");
            }),
            ElevatedButton(
              onPressed: () {
                networkProvider.getData();
                networkProvider.networkButtonPressed();
              },
              child: Text(Strings.string_network_call),
            ),
          ],
        ),
      ),
    );
  }
}
