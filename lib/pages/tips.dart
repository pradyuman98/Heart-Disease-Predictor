import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';

class TipsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      floatingActionButton: floating(),
      body: ListView(
        children: <Widget>[
          Container(child:
          Stack(
            children: <Widget>[
              getImageAssetTips(),

            ],
          ))
        ],
      ),
    );
  }

  Widget floating() {
    return Align(
      alignment: Alignment(1.2, 0.58),
      child: Container(
          child:
          SizedBox(
            height: 60,
            width: 120,
            child:
            FloatingActionButton(
              hoverColor: Colors.black,
              elevation: 15,
              onPressed: () {},
              backgroundColor: Colors.red[500],
              child:Icon(Icons.local_hospital)
            ),
          )),
    );
  }

  Widget getImageAssetTips() {
    AssetImage assetImage = AssetImage('images/10Tips.jpeg');
    Image image = Image(image: assetImage, fit: BoxFit.fill);

    return Container(child: image);
  }
}