
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heart_disease_prediction/pages/sign_up.dart';
import 'package:heart_disease_prediction/sidebar/side_bar.dart';


class LoginPage extends StatefulWidget with NavigationStates {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;

  var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                        onPressed: () async {signIn();Navigator.push(context, MaterialPageRoute(builder: (context)=> SideBar()));},
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
                        onPressed:() {SignUpPage();},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0),side: BorderSide(color: Colors.red, width: 1.5)),
                        padding: const EdgeInsets.all(0.0),
                        elevation: 4.0,
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
                              '@ Sign Up',style: TextStyle(color: Colors.black, fontSize: 27.5, fontWeight: FontWeight.bold),
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