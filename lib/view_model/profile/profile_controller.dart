import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_media_app/res/colors_screen.dart';
import 'package:social_media_app/res/component/input_text_field.dart';
import 'package:social_media_app/view_model/services/session_manager.dart';

import '../../utils/utils.dart';

class ProfileController with ChangeNotifier
{
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  FocusNode nameFocusNode=FocusNode();
  FocusNode phoneFocusNode=FocusNode();
  DatabaseReference ref=FirebaseDatabase.instance.ref().child("users");
  firebase_storage.FirebaseStorage  storage=firebase_storage.FirebaseStorage.instance;
  final pickImage= ImagePicker();
  XFile? _image;
  XFile? get image=>_image;
  Future pickImageGallery(BuildContext context) async
  {
    final pickedFile=  await pickImage.pickImage(source: ImageSource.gallery);
    if(pickedFile != null)
      {
         _image=XFile(pickedFile.path);
        uploadImage(context);
        notifyListeners();

      }

  }
  Future pickImageCamera(BuildContext context) async
  {
    final pickedFile=  await pickImage.pickImage(source: ImageSource.camera);
    if(pickedFile != null)
    {
      _image=XFile(pickedFile.path);
uploadImage(context);
      notifyListeners();
    }

  }
  void getImage( context) {
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pickImageGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(Icons.image),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pickImageCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(Icons.camera),
                  )
                ],
              ),
            ),
          );
        });
  }

  void uploadImage(BuildContext context) async
  {
      firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref("/saleem/"+SessionController().userId.toString());
      firebase_storage.UploadTask uploadTask=storageRef.putFile(File(image!.path).absolute);
      await Future.value(uploadTask);
      final newUrl=await storageRef.getDownloadURL();
      ref.child(SessionController().userId.toString()).update({
        "profile":newUrl.toString()
      }).then((value) {
        Utils().toastMessage("profile updated");
        print("hian uploaded}");
        _image=null;
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        print("shaahb ${error.toString()}");
      });
  }

  Future showUserNameDialog(BuildContext context, String name)
  {
    nameController.text=name;
    return showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              InputTextField(
                  myController:nameController,
                  myFocusNode: nameFocusNode,
                  onFiledSubmittedValue: (value){},
                  keyBoardType: TextInputType.name,
                  hint:"Enter name",
                  onValidator: (value){},
                  obSecure: false)
            ],
          ),
        ),
        title: Text("Enter User Name"),
        actions: [
          TextButton(onPressed: (){


            Navigator.pop(context);
          }, child: Text("Cancel",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.alertColor),)),
          TextButton(onPressed: (){
            ref.child(SessionController().userId.toString()).update({
              "userName":nameController.text.toString()
            }).then((value) {
              Utils().toastMessage("name updated");
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
            Navigator.pop(context);
          }, child: Text("Ok",style: Theme.of(context).textTheme.subtitle1,))

        ],
      );
    });
  }
  Future showPhoneNumberDialog(BuildContext context, String phone)
  {
    nameController.text=phone;
    return showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            children: [
              InputTextField(
                  myController:phoneController,
                  myFocusNode: phoneFocusNode,
                  onFiledSubmittedValue: (value){},
                  keyBoardType: TextInputType.phone,
                  hint:"Enter phone",
                  onValidator: (value){},
                  obSecure: false)
            ],
          ),
        ),
        title: Text("Enter phone number"),
        actions: [
          TextButton(onPressed: (){


            Navigator.pop(context);
          }, child: Text("Cancel",style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.alertColor),)),
          TextButton(onPressed: (){
            ref.child(SessionController().userId.toString()).update({
              "phone":phoneController.text.toString()
            }).then((value) {
              Utils().toastMessage("name updated");
            }).onError((error, stackTrace) {
              Utils().toastMessage(error.toString());
            });
            Navigator.pop(context);
          }, child: Text("Ok",style: Theme.of(context).textTheme.subtitle1,))

        ],
      );
    });
  }
}