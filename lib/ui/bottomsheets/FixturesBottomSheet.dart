import 'package:flutter/material.dart';

class FixturesBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(margin: EdgeInsets.only(top: 10),  alignment: Alignment.topRight,  child: IconButton(icon: Icon(Icons.clear,  color: Colors.red,), onPressed: (){
            Navigator.pop(context);
          }))
        ],

    );
  }
}
