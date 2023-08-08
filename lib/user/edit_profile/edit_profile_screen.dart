import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

   //XFile? image;
  //ImagePicker picker = ImagePicker();
  // void takePicture() async {
  //   XFile? value=await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(value!=null){
  //     setState(() {
  //       //image=XFile(value.path);
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Profile"),),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
