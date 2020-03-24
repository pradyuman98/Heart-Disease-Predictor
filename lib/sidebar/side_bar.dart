import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_prediction/bloc_navigation/navigation_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';



class SideBarLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(

          appBar:PreferredSize(

            child: new Container(
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top
              ),
              child: new Padding(
                padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 20.0,
                    bottom: 20.0
                ),
                child: new Text(
                  'My Heart',
                  style: new TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.red[900],
                        Colors.orange[300]
                      ]
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey[500],
                      blurRadius: 20.0,
                      spreadRadius: 0.5,
                    )
                  ]
              ),
            ),
            preferredSize: Size.fromHeight(68.0),
          ),

        body:

        BlocProvider<NavigationBloc>(
        create: (context)=> NavigationBloc(),
    child:Stack(
    children: <Widget>[
      BlocBuilder<NavigationBloc, NavigationStates>(
        builder: (context, navigationState){
          return navigationState as Widget;
        },


      ),
      SideBar(),
    ],
    )
    )
    ));
  }
}

class SideBar extends StatefulWidget {

  final FirebaseAuth user;

  const SideBar({Key key, this.user}) : super(key: key);

  @override
  SideBarState createState()=>SideBarState();

}

class SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  AnimationController _animationController;
  final animationDuration= const Duration(milliseconds: 300);
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth= MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSidebarOpenedAsync) {
          return AnimatedPositioned(
            duration: animationDuration,
            top: 0,
            bottom: 0,
            left: isSidebarOpenedAsync.data ? 0 : -screenwidth,
            right: isSidebarOpenedAsync.data ? 0 : screenwidth -40,

            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 23),
                    color: Colors.red[800],
                    child: ListView(
                      children: <Widget>[

                        Column(
                          children: <Widget>[
                            SizedBox(height: 30,),
                            ListTile(
                              title: Text("Pradyuman", style: TextStyle(color: Colors.white, fontSize: 20)),
                              subtitle: Text("widget.user.email", style: TextStyle(color: Colors.white, fontSize: 15),),
                              leading: CircleAvatar(
                                child: Icon(Icons.perm_identity, color: Colors.cyan),radius: 40,
                              ),
                            ),
                            Divider(
                              height: 64,
                              thickness: 0.6,
                              color: Colors.grey,
                              indent: 32,
                              endIndent: 32,

                            ),
                            MenuItem(
                              icon: Icons.home,
                              title: "Home",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                              },

                            ),

                            MenuItem(
                              icon: Icons.child_care,
                              title: "Prediction",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PredictionClickedEvent);
                              },


                            ),
                            MenuItem(
                              icon: Icons.touch_app,
                              title: "Symptoms",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SymptomsClickedEvent);
                              },

                            ),

                            MenuItem(
                              icon: Icons.touch_app,
                              title: "Tips",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.TipsClickedEvent);
                              },

                            ),


                            Divider(
                              height: 64,
                              thickness: 0.6,
                              color: Colors.grey,
                              indent: 32,
                              endIndent: 32,

                            ),

                            MenuItem(
                              icon: Icons.perm_identity,
                              title: "Login",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.LoginClickedEvent);
                              },

                            ),

                            MenuItem(
                              icon: Icons.child_care,
                              title: "Sign Up",
                              onTap: (){
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SignUpClickedEvent);
                              },


                            ),
                          ],
                        ),
                      ],
                    )

                  ),
                ),
                Align(
                  alignment: Alignment(0, -1),
                  child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },

                      child:ClipPath(
                        clipper: CustomMenuClipper(),
                        child:
                          Container(
                            width: 35,
                            height: 100,
                            color: Colors.red[800],
                            alignment: Alignment.centerLeft,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.menu_arrow,
                              progress: _animationController.view,
                              color: Colors.white,
                              size: 26,

                            ),

                          )
                      )

                  ),

                ),

              ],
            ),
          );
        }
    );
  }
  void onIconPressed() {

    final animationStatus = _animationController.status;
    final isanimationCompleted= animationStatus == AnimationStatus.completed;
    if (isanimationCompleted){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }


  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 11, 17);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8,0 , height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }

}

class MenuItem extends StatelessWidget {
  
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap}) : super(key: key);
  
  
  
  @override
  Widget build(BuildContext context) {
    return

      GestureDetector(
        onTap: onTap,
        child:  Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(icon, color: Colors.cyan, size: 30, ),
              SizedBox(width: 20,),
              Text(title, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25, color: Colors.white),)
            ],
          ),
        )
      );

  }
}



