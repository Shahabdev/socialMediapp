import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/res/colors_screen.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FocusNode myFocusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final TextInputType keyBoardType;
  final String hint;
  final FormFieldValidator onValidator;
  final bool obSecure;
  final bool enable,autoFocus;
  const InputTextField({super.key,
    required this.myController,
    required this.myFocusNode,
    required this.onFiledSubmittedValue,
    required this.keyBoardType,
    required this.hint,
    required this.onValidator,
    required this.obSecure,
    this.enable=true,
     this.autoFocus=false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: myController,
        onFieldSubmitted: onFiledSubmittedValue,
        obscureText: obSecure,
        validator: onValidator,
        keyboardType: keyBoardType,
        enabled: enable,
        focusNode: myFocusNode,
        autofocus: autoFocus,

        style: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
         border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
           borderSide:const  BorderSide(color: AppColors.textFieldDefaultFocus)
        ),
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.alertColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.textFieldDefaultBorderColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.secondaryColor)
          ),

        ),
      ),
    );
  }
}
