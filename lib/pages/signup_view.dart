import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/pages/shared/ui_helpers.dart';
import 'package:heart_disease_prediction/pages/widgets/busy_button.dart';
import 'package:heart_disease_prediction/pages/widgets/input_field.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:heart_disease_prediction/viewmodels/signup_view_model.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => Scaffold(


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




        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: <Widget>[

              SizedBox(height: 20,),

              Container
                (
                padding: EdgeInsets.only(left: 6),
                height: 140,
                child: Image.asset('images/shield.png',),
              ),

              SizedBox(height: 25,),

              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 40, color: Colors.blue[900], fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 30,),

              InputField(
                placeholder: 'Full Name',
                controller: nameController,
              ),
              verticalSpaceSmall,

              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.busy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),]),

                  SizedBox(height: 15,),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 40.0,

                      child: Image.asset("images/goog.jpg"),),
                    Text("   SignUp with Google", style: TextStyle(fontSize: 18),),

                  ],
                ),

                highlightColor: Colors.red,
                textColor: Colors.blue,
                splashColor: Colors.red[900],
                onPressed: () {
                  Navigator.pushNamed(context, "/e" );

                },
              ),

              SizedBox(height: 10,),




              FlatButton(
                    child: Text("Skip to Home", style: TextStyle(fontSize: 18),),
                    highlightColor: Colors.red,
                    textColor: Colors.blue,
                    splashColor: Colors.red[900],
                    onPressed: () {
                      Navigator.pushNamed(context, "/a" );

                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}