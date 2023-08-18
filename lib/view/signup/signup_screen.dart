import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/utils/utils.dart';

import '../../res/component/input_text_field.dart';
import '../../res/component/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/signUp/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey=GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final userFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
                create: (_) => SignUpController(),
                child: Consumer<SignUpController>(
                  builder: (context, provider, child) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            "Register Yourself \n to  ConnectWave",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            "Register to ConnectWave \n- Where Connections Come Alive!",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            width: 150, // Adjust size accordingly
                            height: 200,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/signup.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                            children: [
                              InputTextField(
                                  myController: userController,
                                  myFocusNode: userFocusNode,
                                  onFiledSubmittedValue: (value) {
                                    Utils().focusNode(
                                        context, userFocusNode, emailFocusNode);
                                  },
                                  keyBoardType: TextInputType.name,
                                  hint: "User name",
                                  onValidator: (value) {
                                    return value.isEmpty ? "enter User name" : null;
                                  },
                                  obSecure: false),
                              InputTextField(
                                  myController: emailController,
                                  myFocusNode: emailFocusNode,
                                  onFiledSubmittedValue: (value) {
                                    Utils().focusNode(
                                        context, emailFocusNode, passwordFocusNode);
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: "E-mail",
                                  onValidator: (value) {
                                    return value.isEmpty ? "enter e-mail" : null;
                                  },
                                  obSecure: false),
                              InputTextField(
                                  myController: passwordController,
                                  myFocusNode: passwordFocusNode,
                                  onFiledSubmittedValue: (value) {},
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: "Password",
                                  onValidator: (value) {
                                    return value.isEmpty ? "enter password" : null;
                                  },
                                  obSecure: false),
                            ],
                          )),

                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          RoundButton(title: "Sign up",
                              loading: provider.loading,
                              onPress: () {

                             if(_formKey.currentState!.validate())
                               {
                                 provider.signUp(context,
                                     userController.text,
                                     emailController.text,
                                     passwordController.text);

                               }

                          }),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.loginScreen);
                            },
                            child: Text.rich(TextSpan(
                                text: "Already have an account? ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 15, color: Colors.brown),
                                children: [
                                  TextSpan(
                                    text: "Login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 15,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.black),
                                  )
                                ])),
                          )
                        ],
                      ),
                    );
                  },
                ))),
      ),
    );
  }
}
