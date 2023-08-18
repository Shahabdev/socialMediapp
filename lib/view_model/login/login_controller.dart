import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';

import '../../utils/utils.dart';
import '../services/session_manager.dart';

class LoginController with ChangeNotifier
{
  final _auth =FirebaseAuth.instance;


  bool _loading = false;
  bool get loading=> _loading;
  setLoading(bool  value)
  {
    _loading=value;
    notifyListeners();
  }

  void login(BuildContext context,String email,String password )
  {
    setLoading(true);
    try{

      _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        SessionController().userId=value.user!.uid.toString();
        Utils().toastMessage("login successfully");
        Navigator.pushNamed(context, RoutesName.dashBoard);


      }).onError((error, stackTrace) {
        setLoading(false);
        Utils().toastMessage(error.toString());
      });

    } catch(e)
    {
      setLoading(false);
      Utils().toastMessage(e.toString());
    }
  }
}