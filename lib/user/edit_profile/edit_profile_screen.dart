
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/utils/utils.dart';

import '../../provider/app_provider.dart';
import '../../widgets/round_button.dart';
import '../firebase_firestore/firebase_storage.dart';
import '../models/user_model/user_model.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  File? image;
  void takePicture() async{
    XFile?  value=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);
    if(value!=null){
      setState(() {
        image=File(value.path);
        //print(image.toString());
      });
    }
  }
  TextEditingController textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.red,
        title: Text("Edit Profile",style: TextStyle(color: Colors.white,fontFamily: 'serif'),),

      ),
      body: ListView(
        children: [
          CupertinoButton(
            onPressed: (){
              takePicture();
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 70,
              child:image==null? Icon(Icons.camera_alt):Image.file(image!,width: 400,height: 400,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: textcontroller,
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: appProvider.getUserInformation.name,

                border: OutlineInputBorder(
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red ),
                ),
                prefixIcon: Icon(Icons.person),
                prefixIconColor:Colors.red,
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RoundButton(title: "Update", onPress: () async{
              UserModel userModel=appProvider.getUserInformation.copyWith(name: textcontroller.text);
              appProvider.updateUserInfoFirebase(context, userModel,image!);
              utils().toastMassage("Successfull Update.!!");
              // String imageUrl=await FirebaseStorageHelper.instance.uploadUserImage(image!);
              // print("Hello SSG ");
              // print(imageUrl);

            }),
          )
        ],
      ),
    );
  }
}
