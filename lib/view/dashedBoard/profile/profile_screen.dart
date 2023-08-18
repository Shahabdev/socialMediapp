import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/res/colors_screen.dart';
import 'package:social_media_app/view_model/profile/profile_controller.dart';
import 'package:social_media_app/view_model/services/session_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref=FirebaseDatabase.instance.ref("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,
      body:ChangeNotifierProvider(
        create:(_)=> ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context,provider,child)
          {
            return  StreamBuilder(
              stream: ref.child(SessionController().userId.toString()).onValue,
              builder: (context,AsyncSnapshot snapshot)
              {
                if(!snapshot.hasData)
                {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.hasData)
                {
                  Map<dynamic,dynamic> map= snapshot.data.snapshot.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 75,),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Center(
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.secondaryColor,
                                        width: 5
                                    )
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child:provider.image == null  ? map["profile"].toString()=="" ? Icon(Icons.person,size: 135,)
                                      :Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("https://www.mykhel.com/thumb/247x100x233/cricket/players/1/5601.jpg"),
                                    loadingBuilder: (context,child,loadingProgress)
                                    {
                                      if(loadingProgress==null) return child ;
                                      return Center(child: CircularProgressIndicator());
                                    },
                                    errorBuilder: (context,object,stack)
                                    {
                                      return Center(child: Text("something went to wrong"));
                                    },
                                  ):Image.file(File(provider.image!.path).absolute),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 120),
                              child: Container(

                                child: InkWell(
                                  onTap: ()
                                  {
                                      provider.getImage(context);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.primaryIconColor,

                                    child: Icon(Icons.add,color: AppColors.whiteColor,size: 35,),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 70,),

                        InkWell(
                          onTap: ()
                          {
                            provider.showUserNameDialog(context, map["userName"]);
                          },
                          child: ReusableRow(
                              title: "UserName", iconData: Icons.person, value:map["userName"]),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            provider.showPhoneNumberDialog(context, map["phone"]);
                          },
                          child: ReusableRow(
                              title: "Phone", iconData: Icons.phone, value:map["phone"]== " " ? "xxx-xxxx-xxx":map["phone"]),
                        ),
                        ReusableRow(
                            title: "E-mail", iconData: Icons.email_outlined, value:map["email"]),



                      ],
                    ),
                  );
                }
                else
                {
                  return Center(child: Text("something went to wrong"));

                }

              },
            );
          },
        ),

      )




    );
  }
}

class ReusableRow extends StatelessWidget {
 final String title,value;
  final IconData iconData;
 const  ReusableRow({super.key,required this.title,required this.iconData,required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,style: Theme.of(context).textTheme.subtitle2,),
          leading: Icon(iconData,color: AppColors.primaryIconColor,),
          trailing: Text(value.toString(),style: Theme.of(context).textTheme.subtitle2),
        ),
        Divider(
          color: AppColors.dividedColor.withOpacity(0.4),
         
        )
      ],
    );
  }
}

