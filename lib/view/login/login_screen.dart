import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/res/component/input_text_field.dart';
import 'package:social_media_app/res/component/round_button.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view_model/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final  emailFocusNode =FocusNode();
  final  passwordFocusNode =FocusNode();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
     double height=MediaQuery.of(context).size.height *1;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.03,),
                Text("Welcome to ConnectWave",style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),),
                SizedBox(height: height * 0.01,),
                Text("Welcome to ConnectWave \n- Where Connections Come Alive!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,),
                SizedBox(height: height * 0.01,),

                Container(
                  width: 150, // Adjust size accordingly
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/download.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

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
                      InputTextField(
                          myController: passwordController,
                          myFocusNode: passwordFocusNode,

                          onFiledSubmittedValue: (value){
                          },
                          keyBoardType: TextInputType.emailAddress,
                          hint: "Password",
                          onValidator: (value)
                          {
                            return value.isEmpty ? "enter password":null;
                          },
                          obSecure: true
                      ),
                ],)),

                SizedBox(height: height *0.03,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, RoutesName.forgotPasswordScreen);
                  }, child: Text("Forgot Password",
                    style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15,decoration:TextDecoration.underline,color: Colors.black ),)),
                ),
                SizedBox(height: height *0.03,),
                ChangeNotifierProvider(create: (_)=>LoginController(),
                child: Consumer<LoginController>(
                  builder: (context,provider,child)
                  {
                    return RoundButton(title: "Login",loading: provider.loading, onPress: (){
                      if(_formKey.currentState!.validate())
                      {
                        provider.login(context, emailController.text, passwordController.text);
                      }

                    });
                  },
                ),),

                SizedBox(height: height *0.03,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.signUpScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                        style:Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15,color: Colors.brown) ,
                      children: [
                                  TextSpan(
                                    text: "sign up",
                                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15,decoration: TextDecoration.underline,color: Colors.black),

                                  )
                      ]
                    )
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
