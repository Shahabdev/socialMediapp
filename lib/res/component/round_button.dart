import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/res/colors_screen.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color,textColor;
  final VoidCallback onPress;
  final bool loading;
  const RoundButton({super.key,
     required this.title,
     required this.onPress,
     this.color=AppColors.primaryMaterialColor,
    this.textColor=AppColors.whiteColor,
    this.loading=false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null: onPress ,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),

        ),
        child: Center(
          child:loading?CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)
              :Text(title,style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16,color: textColor),) ,),
      ),
    );
  }
}
