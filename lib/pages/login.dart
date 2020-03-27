
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget with NavigationStates {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email, _password;

  var user;

  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  String x;


  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
        x=_googleSignIn.currentUser.displayName;
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
            iconSize: 30.0,
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
              child:  DrawerHeader(
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

                    )
                ),

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
                        Navigator.of(context).pushNamed("/e");
                      },
                    ),

                    ListTile(

                      title: Text('Sign Up',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                      onTap: () {
                        Navigator.of(context).pushNamed("/f");
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),


        floatingActionButton: floating(),
        body: ListView(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.fromLTRB(15, 80, 0, 0),
                        child: Text("Hello", style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 150, 0, 0),
                        child: Text("There", style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(225, 150, 0, 0),
                        child: Text(".", style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.red[800]),),
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Column(
                              children: <Widget>[
                                TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if(input.isEmpty){
                                      return 'Provide an email';
                                    }
                                  },
                                  onSaved: (input) => _email = input,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                    hintText: "Enter Registerd Email"

                                  ),

                                ),
                                TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if(input.length < 6){
                                      return 'Password is of 6 characters';
                                    }
                                  },
                                  onSaved: (input) => _password = input,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                    hintText: "Enter Password"

                                  ),

                                  obscureText: true,
                                )
                              ]))


                      ,
                      SizedBox(height: 10.0,),

                      Container(
                        alignment: Alignment(1, 0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat', color: Colors.red[700], fontSize: 16),),

                        ),

                      ),

                      SizedBox(height: 30.0,),

                      RaisedButton(
                        onPressed: () {_login();},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        elevation: 6.0,
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.red,
                                Colors.purpleAccent,
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(80.0)),
                          ),
                          child: Container(
                            height: 65,
                            width: 300,
                            alignment: Alignment.center,
                            child: const Text(
                              'Login',style: TextStyle(color: Colors.white, fontSize: 27.5, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      RaisedButton(
                        onPressed:() {_logout();},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),side: BorderSide(color: Colors.red, width: 1.5)),
                        padding: const EdgeInsets.all(0.0),
                        elevation: 1.0,
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.white,
                                Colors.lightBlueAccent,
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(80.0),),
                          ),
                          child: Container(
                            height: 65,
                            width: 300,
                            alignment: Alignment.center,
                            child: const Text(
                              'Log Out',style: TextStyle(color: Colors.black, fontSize: 27.5, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),



                      SizedBox(height: 20.0,),


                    ],
                  ),

                ),
              ],
            )
          ],
        )

    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseAuth user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseAuth;
      }catch(e){
        print(e.message);
      }


    }

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
                onPressed: (){},
                backgroundColor: Colors.red[500],
                child:Icon(Icons.local_hospital)
            ),
          )),
    );
  }
}