import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/LeaguesScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_provider/providers/CountriesProvider.dart';
import 'package:flutter_provider/utils/Strings.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static String route = "/";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height;
  late double width;
  var countriesProvider;
  var controller = TextEditingController();
  var appbarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    height = mediaQueryData.size.height;
    width = mediaQueryData.size.width;

    countriesProvider = Provider.of<CountriesProvider>(context, listen: true);
    countriesProvider.retrieveCountries();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: !countriesProvider.isSearchMode
            ? Text(Strings.string_title)
            : Container(
                height: appbarHeight * 0.7,
                child: TextField(
                  onChanged: (text) {
                    countriesProvider.searchCountries(text);
                  },
                  autofocus: true,
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: Strings.country_search_hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16, bottom: 16),
                  ),
                ),
              ),
        actions: [
          !countriesProvider.isSearchMode
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    countriesProvider.onSearchIconTap();
                  })
              : MaterialButton(
                  onPressed: () {
                    countriesProvider.onCancelTap();
                    setState(() {
                      controller.text = Strings.empty_text;
                    });
                  },
                  child: Text(
                    Strings.cancel_search,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          if (!countriesProvider.isSearchMode)
            PopupMenuButton<String>(
              onSelected: (_) {},
              itemBuilder: (BuildContext context) {
                return {'Language', 'About', "Rate us"}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(choice),
                        if (choice == "Language")
                          Icon(
                            Icons.language,
                            color: Colors.grey,
                          )
                        else if (choice == "About")
                          Icon(
                            Icons.info,
                            color: Colors.grey,
                          )
                        else if (choice == "Rate us")
                          Icon(Icons.star, color: Colors.grey,)
                      ],
                    ),
                  );
                }).toList();
              },
            ),
        ],
      ),
      body: Center(
        child: Consumer<CountriesProvider>(builder: (context, networkProvider, child) {
          return ListView.builder(
              itemCount: networkProvider.countries.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return _buildCountryWidget(networkProvider.countries[index].countryCode, networkProvider.countries[index].name, networkProvider.countries[index].flagImageUrl, context);
              });
        }),
      ),
    );
  }

  Widget _buildCountryWidget(String code, String name, String imgUrl, BuildContext context) {
    double card_height = height * 0.1;
    double card_width = width;

    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, LeaguesScreen.route, arguments: {"code": code});
        },
        child: Container(
          height: card_height,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.yellow,
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 5),
                    height: card_height * 0.3,
                    width: card_width * 0.1,
                    child: SvgPicture.network(
                      imgUrl,
                      placeholderBuilder: (_) => SvgPicture.asset("assets/placeholder.svg"),
                    ))
              ],
            ),
          ),
        ));
  }
}
