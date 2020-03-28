import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heart_disease_prediction/locator.dart';
import 'package:heart_disease_prediction/pages/homepage.dart';
import 'package:heart_disease_prediction/pages/login.dart';
import 'package:heart_disease_prediction/pages/login_view.dart';
import 'package:heart_disease_prediction/pages/prediction.dart';
import 'package:heart_disease_prediction/pages/router.dart';
import 'package:heart_disease_prediction/pages/symptoms.dart';
import 'package:heart_disease_prediction/pages/tips.dart';
import 'package:heart_disease_prediction/services/dialog_service.dart';
import 'package:heart_disease_prediction/services/navigation_service.dart';
import 'managers/dialog_manager.dart';

GetIt locator = GetIt.instance;

const String LoginViewRoute = "LoginView";
const String SignUpViewRoute = "SignUp";
//const String HomeViewRoute = "HomeView";


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Heart Check",
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 9, 202, 172),
        backgroundColor: Color.fromARGB(255, 26, 27, 30),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Open Sans',
        ),
      ),
      home: LoginView(),
      onGenerateRoute: generateRoute,
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => HomePage(),
        "/b": (BuildContext context) => PredictionMainPage(),
        "/c": (BuildContext context) => TipsPage(),
        "/d": (BuildContext context) => SymptomsPage(),
        "/e": (BuildContext context) => LoginPage(),
        //"/f": (BuildContext context) => SignUpPage(),
      },
    );
  }}