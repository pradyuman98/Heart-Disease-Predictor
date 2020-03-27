import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_disease_prediction/constants/route_names.dart';

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
                      child: _isLoggedIn
                          ? Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                          Text(_googleSignIn.currentUser.displayName),
                        ],
                      )
                          : Center(
                        child: OutlineButton(
                          child: Text("Login with Google"),
                          onPressed: () {
                            try{
                              Navigator.of(context).pushNamed("/e");
                            }catch(e){
                              print(e.message);
                            }

                          },
                        ),
                      )),

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

              Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: <Widget>[

                    ListTile(

                      title: Text('Home', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.of(context).pushNamed("/a");
                      },
                    ),
                    ListTile(
                      title: Text('Prediction',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.of(context).pushNamed("/b");
                      },
                    ),
                    ListTile(
                      title: Text('Symptoms',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.of(context).pushNamed("/d");
                      },
                    ),
                    ListTile(
                      title: Text('Tips',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.of(context).pushNamed("/c");
                      },
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.6,
                      color: Colors.grey,
                      indent: 32,
                      endIndent: 32,

                    ),

                    ListTile(
                      title: Text('Login',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.pushNamed(context, "LoginView");
                      },
                    ),

                    ListTile(

                      title: Text('Sign Up',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.pushNamed(context, "SignUp");
                      },
                    ),
                  ],
                ),
              ),

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
