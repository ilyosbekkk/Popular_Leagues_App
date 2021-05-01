

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_provider/providers/CountriesProvider.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;

    var networkProvider = Provider.of<NetworkProvider>(context, listen: false);
    networkProvider.retrieveCountries();
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.string_title),
      ),
      body: Center(
        child: Consumer<NetworkProvider>(builder: (context, networkProvider, child) {
          return !networkProvider.isLoading
              ? ListView.builder(
                  itemCount: networkProvider.countries.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _buildCountryWidget(networkProvider.countries[index].name, networkProvider.countries[index].flagImageUrl);
                  })
              : CircularProgressIndicator();
        }),
      ),
    );
  }

  //widgets
  Widget _buildCountryWidget(String name, String imgUrl) {
   double card_height = height*0.1;
   double  card_width = width;

    return InkWell(
        child: Container(
        height: card_height,
        child: Card(

          color: Colors.yellowAccent,
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Container(
              margin:
              EdgeInsets.only(left: 5),
              child: Text(name,  style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ), Container(margin: EdgeInsets.only(right: 5),  height:card_height*0.3, width: card_width*0.1, child:  imgUrl!= null? SvgPicture.network(imgUrl): SvgPicture.asset("assets/no-photo.svg"),)],
          ),
        ),
      )
    );
  }
}
