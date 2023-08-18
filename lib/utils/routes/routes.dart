import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view/forgotpassword/forgotPassword_screen.dart';
import 'package:social_media_app/view/login/login_screen.dart';
import 'package:social_media_app/view/signup/signup_screen.dart';
import 'package:social_media_app/view/splash/splash_screen.dart';

import '../../view/dashedBoard/dashBoard_screen.dart';

class Routes
{
  static Route<dynamic> generateRoutes(RouteSettings settings)
  {
    final arguments=settings.arguments;
    switch(settings.name)
        {
      case RoutesName.splashScreen:
         return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.loginScreen:
         return MaterialPageRoute(builder: (_)=> const LoginScreen());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (_)=> const SignUpScreen());
      case RoutesName.dashBoard:
        return MaterialPageRoute(builder: (_)=> const DashBoardScreen());
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordScreen());

      default:
          return MaterialPageRoute(builder: (_) => Scaffold(
            body: Center(
              child: Text("routes is not defined ${settings.name}"),
            ),
          ));
    }
  }
}