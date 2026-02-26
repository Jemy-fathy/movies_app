import 'package:flutter/material.dart';
import 'package:movies_app/router/page_route_names.dart';
import 'package:movies_app/screens/login/login.dart';
import 'package:movies_app/screens/onbording/start_watching_screen.dart';
import 'package:movies_app/screens/splash_screen.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case PageRouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),
          settings: settings
        );
      case PageRouteNames.onBoarding:
        return MaterialPageRoute(builder: (context) => const StartWatchingScreen(),
          settings: settings
        );
      case PageRouteNames.login:
        return MaterialPageRoute(builder: (context) => const Login(),
          settings: settings
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),
          settings: settings
        );
    }
  }
}