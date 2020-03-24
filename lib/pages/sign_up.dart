
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';

class SignUpPage extends StatelessWidget with NavigationStates {
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
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red[800]),
                            ),
                            hintText: "Enter Name e.g. Rakesh Kumar"
                        ),
                      ),
                      SizedBox(height: 10.0,),

                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red[800]),
                            ),
                            hintText: "Enter Email Id"
                        ),
                      ),
                      SizedBox(height: 20.0,),

                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 18),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red[800]),
                            ),
                            hintText: "Set Password"
                        ),
                      ),

                      SizedBox(height: 40.0,),

                      Container(
                        height: 65.0,
                        width: 300.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.red[500],
                          shadowColor: Colors.redAccent,
                          elevation: 7.0,
                          child: GestureDetector(
                              onTap:() {},
                              child:Center(child:
                              Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
                              )
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0,),

                      Container(
                          height: 65.0,
                          width: 300.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.redAccent,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(40.0),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Icon(Icons.alternate_email,color: Colors.blue,size: 30,),
                                ),
                                SizedBox(width: 10.0,),
                                Center(
                                  child: Text("Sign Up with Gmail", style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[500],
                                  ),),
                                )
                              ],
                            ),

                          )
                      ),


                    ],
                  ),

                ),
              ],
            )
          ],
        )

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


}