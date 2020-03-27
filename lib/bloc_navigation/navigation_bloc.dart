
import 'package:bloc/bloc.dart';
import 'package:heart_disease_prediction/pages/homepage.dart';
import 'package:heart_disease_prediction/pages/login.dart';
import 'package:heart_disease_prediction/pages/prediction.dart';
import 'package:heart_disease_prediction/pages/prevention.dart';
import 'package:heart_disease_prediction/pages/sign_up.dart';
import 'package:heart_disease_prediction/pages/symptoms.dart';
import 'package:heart_disease_prediction/pages/tips.dart';

enum NavigationEvents {HomePageClickedEvent, PreventionClickedEvent, PredictionClickedEvent, SymptomsClickedEvent,
  TipsClickedEvent, }

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.PreventionClickedEvent:
        yield PreventionPage();
        break;

      case NavigationEvents.PredictionClickedEvent:
        yield PredictionPage();
        break;

      case NavigationEvents.SymptomsClickedEvent:
        yield SymptomsPage();
        break;

      case NavigationEvents.TipsClickedEvent:
        yield TipsPage();
        break;

    }
    }
  }
