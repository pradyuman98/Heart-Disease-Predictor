import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';

class SymptomsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: floating(),
      body: ListView(
        children: <Widget>[
          Container(child:
          Stack(
            children: <Widget>[
              getImageAssetSymptoms(),

            ],
          ))
        ],
      ),
    );
  }

  Widget floating() {
    return Align(
      alignment: Alignment(1.15, 0.8),
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
}
Widget getImageAssetSymptoms(){

  AssetImage assetImage= AssetImage('images/Symptoms.jpeg');
  Image image = Image(image: assetImage, fit: BoxFit.fill);

  return Container(child: image);
}