import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view_model/services/session_manager.dart';

class SplashServices
{

  isLogin(BuildContext context)
  {
    final  auth=FirebaseAuth.instance;
    final user= auth.currentUser;
    if(user != null)
      {
        SessionController().userId=user.uid.toString();
        Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context,RoutesName.dashBoard));
      }
    else
      {
        Timer(Duration(seconds: 3),()=> Navigator.pushNamed(context,RoutesName.loginScreen));
      }

  }
}