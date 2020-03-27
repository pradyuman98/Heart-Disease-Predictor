import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget with NavigationStates {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

      floatingActionButton: floating(),
      body:  ListView(
        children: <Widget>[
          SizedBox(height: 25.0, ),
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
