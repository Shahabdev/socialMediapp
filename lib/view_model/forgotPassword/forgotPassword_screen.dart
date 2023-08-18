import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../services/session_manager.dart';

class ForgotPasswordController with ChangeNotifier
{
  final _auth =FirebaseAuth.instance;


  bool _loading = false;
  bool get loading=> _loading;
  setLoading(bool  value)
  {
    _loading=value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context,String email)
  {
    setLoading(true);
    try{

      _auth.sendPasswordResetEmail(email: email).then((value) {
        setLoading(false);
        Utils().toastMessage("please check your email");



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