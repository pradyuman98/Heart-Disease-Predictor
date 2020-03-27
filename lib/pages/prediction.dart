import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);


  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }


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
        key: _scaffoldKey,
        appBar: PreferredSize(child:AppBar(
          leading: IconButton(
            iconSize: 32.0,
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          title: Text("My Heart", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.red[900],
                      Colors.orange[300]
                    ])
            ),
          ),
        ),
          preferredSize: Size.fromHeight(66.0),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Container(
                height: 150,
                child: DrawerHeader(
                  child: Center(
                      child: Container(
                        height: 100,
                        child:Image.asset('images/shield.png') ,)),

                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.red[900],
                            Colors.orange[300]
                          ])
                  ),
                ),

              ),

              ListTile(
                title: Text('Home', style: TextStyle(fontSize: 25,),),
                leading: Image.asset("images/home.png"),
                onTap: () {
                  Navigator.of(context).pushNamed("/a");
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text('Prediction',style: TextStyle(fontSize: 25),),
                leading: Image.asset("images/data-mining.png"),
                onTap: () {
                  Navigator.of(context).pushNamed("/b");
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text('Symptoms',style: TextStyle(fontSize: 25),),
                leading: Image.asset("images/test.png"),

                onTap: () {
                  Navigator.of(context).pushNamed("/d");
                },
              ),
              SizedBox(height: 10,),
              ListTile(
                title: Text('Tips',style: TextStyle(fontSize: 25),),
                leading: Image.asset("images/tips.png"),

                onTap: () {
                  Navigator.of(context).pushNamed("/c");
                },
              ),
              SizedBox(height: 10,),
              Divider(
                height: 64,
                thickness: 0.6,
                color: Colors.grey,
                indent: 32,
                endIndent: 32,

              ),

              ListTile(
                title: Text('Login',style: TextStyle(fontSize: 25),),
                leading: Image.asset("images/login.png"),

                onTap: () {
                  Navigator.pushNamed(context, "LoginView");
                },
              ),
              SizedBox(height: 10,),

              ListTile(
                title: Text('Sign Up',style: TextStyle(fontSize: 25),),
                leading: Image.asset("images/customer.png"),

                onTap: () {
                  Navigator.pushNamed(context, "SignUp");
                },
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),


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
