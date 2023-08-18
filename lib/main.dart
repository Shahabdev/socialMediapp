import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/res/colors_screen.dart';
import 'package:social_media_app/res/fonts.dart';
import 'package:social_media_app/utils/routes/routes.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: AppColors.primaryMaterialColor,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 22 ,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor),
          ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w500,height: 1.6),
          headline2: TextStyle(fontSize: 32,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w500,height: 1.6),
          headline3: TextStyle(fontSize: 28,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w500,height: 1.9),
          headline4: TextStyle(fontSize: 24,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w500,height: 1.6),
          headline5: TextStyle(fontSize: 20,fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w500,height: 1.6),
          headline6: TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w700,height: 1.6),
          bodyText1: TextStyle(fontSize: 17,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryMaterialColor,fontWeight: FontWeight.w700,height: 1.6),
          bodyText2: TextStyle(fontSize: 14,fontFamily: AppFonts.sfProDisplayRegular,color: AppColors.primaryMaterialColor,height: 1.6),
            caption:   TextStyle(fontSize: 12,fontFamily: AppFonts.sfProDisplayBold,color: AppColors.primaryMaterialColor,height: 2.26),

        )

      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
