import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';

class PredictionPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return PredictionMainPage();
  }
}


class PredictionMainPage extends StatefulWidget {
  @override
  PredictionMainPageState createState() => PredictionMainPageState();
}

class PredictionMainPageState extends State<PredictionMainPage> {
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _accountType = <String>[
    'Male',
    'Female',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: Colors.white,

        body:

        Form(
          key: _formKeyValue,
          autovalidate: true,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            children: <Widget>[

              SizedBox(height: 25.0),

              SizedBox(
                height: 215,
                width: 280,
                child:   getImageAsset(),
              ),

              SizedBox(height: 20.0),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter your Age e.g. 24',
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number
              ),
              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Color(0xff11b719),
                  ),
                  hintText: 'Enter C.P e.g 2',
                  labelText: 'Chest Pain',
                ),
              ),

              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.smoking_rooms,
                    color: Color(0xff11b719),
                  ),
                  hintText: 'Enter Yes or No',
                  labelText: 'Smoking',
                ),
              ),


              new TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Color(0xff11b719),
                  ),
                  hintText: 'Enter TrestBps Value e.g. 130',
                  labelText: 'TrestBps',
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Cholestrol Level e.g 235',
                    labelText: 'Cholestrol',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter FBS Level e.g 1',
                    labelText: 'Fasting Blood Sugar',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter your Phone Details',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Rest ECG value e.g 0',
                    labelText: 'Rest ECG',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Thalach value e.g 185',
                    labelText: 'Thalach',
                  ),
                  keyboardType: TextInputType.number
              ),


              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Exhang value e.g 1',
                    labelText: 'Exercise Induced Pain',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Old Peak value e.g 2.3',
                    labelText: 'Old Peak',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Slope value e.g 2',
                    labelText: 'Slope',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter CA value e.g 2',
                    labelText: 'CA',
                  ),
                  keyboardType: TextInputType.number
              ),

              new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Color(0xff11b719),
                    ),
                    hintText: 'Enter Thal value e.g 2',
                    labelText: 'Thal',
                  ),
                  keyboardType: TextInputType.number
              ),


              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.perm_identity,
                    size: 30.0,
                    color: Color(0xff11b719),
                  ),
                  SizedBox(width: 50.0),
                  DropdownButton(
                    items: _accountType
                        .map((value) =>
                        DropdownMenuItem(
                          child: Text(
                            value,
                            style: TextStyle(color: Color(0xff11b719)),
                          ),
                          value: value,
                        ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      print('$selectedAccountType');
                      setState(() {
                        selectedType = selectedAccountType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Gender',
                      style: TextStyle(color: Color(0xff11b719)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                      color: Color(0xff11b719),
                      textColor: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Submit", style: TextStyle(fontSize: 24.0)),
                            ],
                          )),
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ],
              ),
            ],
          ),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/original.png');
    Image image = Image(image: assetImage, fit: BoxFit.fill);

    return Container(child: image);
  }
}
