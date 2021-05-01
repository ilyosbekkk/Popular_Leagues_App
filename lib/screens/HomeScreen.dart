import 'package:flutter/material.dart';
import 'package:flutter_provider/models/CountriesModel.dart';
import 'package:flutter_provider/providers/CountriesProvider.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("calling");
    var networkProvider = Provider.of<NetworkProvider>(context, listen: false);

    networkProvider.getData();
    networkProvider.networkButtonPressed();
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.string_title),
      ),
      body: Center(
        child: Consumer<NetworkProvider>(builder: (context, networkProvider, child) {
          print(networkProvider.countries);
          return ListView.builder(
              itemCount: networkProvider.count,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Text(networkProvider.countries[index].name);
              });
        }),
      ),
    );
  }
}
