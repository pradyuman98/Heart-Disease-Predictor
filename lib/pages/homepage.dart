import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floating(),
      body:  ListView(
        children: <Widget>[
          Container(child:
          Stack(
            children: <Widget>[
              getImageAssetHome(),

            ],
          ))
        ],
      ),
    );



  }

Widget floating() {

return  Align(
  alignment: Alignment(1.21, 0.63),
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

  Widget getImageAssetHome() {
    AssetImage assetImage = AssetImage('images/Home.jpeg');
    Image image = Image(image: assetImage, fit: BoxFit.fill);

    return Container(child: image);
  }
}
