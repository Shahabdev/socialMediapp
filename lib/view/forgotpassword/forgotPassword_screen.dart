import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/view_model/forgotPassword/forgotPassword_screen.dart';

import '../../res/component/input_text_field.dart';
import '../../res/component/round_button.dart';
import '../../view_model/login/login_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final  emailFocusNode =FocusNode();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height *1;

    return Scaffold(
      appBar: AppBar(
       elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.03,),
              Text("Forgot Password",style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),),
              SizedBox(height: height * 0.03,),
              Text("Enter Email \n- To recover your account",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: height * 0.05,),

            Form(
                key: _formKey,
                child: Column(children: [
              InputTextField(
                  myController: emailController,
                  myFocusNode: emailFocusNode,

                  onFiledSubmittedValue: (value){

                  },
                  keyBoardType: TextInputType.emailAddress,
                  hint: "E-mail",
                  onValidator: (value)
                  {
                    return value.isEmpty ? "enter e-mail":null;
                  },
                  obSecure: false
              ),
            ],)),



              SizedBox(height: height *0.03,),

              SizedBox(height: height *0.03,),
              ChangeNotifierProvider(create: (_)=>ForgotPasswordController(),
                child: Consumer<ForgotPasswordController>(
                  builder: (context,provider,child)
                  {
                    return RoundButton(title: "Recover",loading: provider.loading, onPress: (){
                      if(_formKey.currentState!.validate())
                      {
                        provider.forgotPassword(context, emailController.text);
                      }

                    });
                  },
                ),),

              SizedBox(height: height *0.03,),


            ],
          ),
        ),
      ),
    );
  }
}
