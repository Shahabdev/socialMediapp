import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_app/utils/utils.dart';

import '../services/session_manager.dart';

class SignUpController with ChangeNotifier
{
  final _auth =FirebaseAuth.instance;
  DatabaseReference ref=FirebaseDatabase.instance.ref().child("users");

  bool _loading = false;
  bool get loading=> _loading;
  setLoading(bool  value)
  {
    _loading=value;
    notifyListeners();
  }

  void signUp(BuildContext context,String userName,String email,String password )
  {
    setLoading(true);
    try{

      _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        SessionController().userId=value.user!.uid.toString();
        Utils().toastMessage("user created");
        ref.child(value.user!.uid.toString()).set({

          "uid":value.user!.uid.toString(),
          "email":email,
          "userName":userName,
          "onlineStatus":" ",
          "phone": " ",
           "profile": " "
        }).then((value) {


          Utils().toastMessage("information stored successfully");
        }).onError((error, stackTrace) {

          Utils().toastMessage(error.toString());
        });

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