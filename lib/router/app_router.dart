import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/router/page_route_names.dart';
import 'package:movies_app/modules/login/view/forget_password.dart';
import 'package:movies_app/modules/login/view/login.dart';
import 'package:movies_app/modules/login/view_model/login_view_model.dart';
import 'package:movies_app/modules/onbording/start_watching_screen.dart';
import 'package:movies_app/modules/splash_screen.dart';

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
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => LoginBloc(),
          child: const Login(),
        ),
          settings: settings
        );
      case PageRouteNames.forgotPassword:
        return MaterialPageRoute(builder: (context) =>  ForgetPassword(),
          settings: settings
        );
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),
          settings: settings
        );
    }
  }
}