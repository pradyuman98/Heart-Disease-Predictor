import 'package:heart_disease_prediction/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/constants/route_names.dart';
import 'package:heart_disease_prediction/pages/login_view.dart';
import 'package:heart_disease_prediction/pages/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}