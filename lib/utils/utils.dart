import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_app/res/colors_screen.dart';

class Utils
{
  void focusNode(BuildContext context,FocusNode currentFocus,FocusNode nextFocus)
  {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void toastMessage(String message)
  {
    Fluttertoast.showToast(msg: message,
    backgroundColor: AppColors.primaryTextTextColor,
      textColor: AppColors.whiteColor,
      fontSize: 16
    );
  }
}