import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/NetworkProvider.dart';
import 'package:flutter_provider/providers/NumberProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var numberProvider = Provider.of<NumberModel>(context, listen: false);
    var networkProvider = Provider.of<NetworkProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<NumberModel>(builder: (context, numberModel, child) {
              return Text("${numberModel.number}");
            }),
            ElevatedButton(
              onPressed: () {
                numberProvider.increment();
              },
              child: Text("+"),
            ),
            ElevatedButton(
              onPressed: () {
                numberProvider.decrement();
              },
              child: Text("-"),
            ),
            Consumer<NetworkProvider>(builder: (context, networkProvider, child) {
              if (networkProvider.isLoading)
                return CircularProgressIndicator();
              else
                return Text("${networkProvider.text}");
            }),
            ElevatedButton(
              onPressed: () {
                networkProvider.getData();
                networkProvider.networkButtonPressed();
                },
              child: Text("make a  network call"),
            ),
          ],
        ),
      ),
    );
  }
}
