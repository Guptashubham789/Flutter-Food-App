import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/account_screen/profile_screen.dart';
import 'package:ssg_demo1/utils/utils.dart';

import '../../widgets/round_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newcontroller=TextEditingController();
  TextEditingController confirmcontroller=TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>
                ProfileScreen())),
          ),
          backgroundColor: Colors.red,
          title: Text("Change Password",style: TextStyle(color: Colors.white,fontFamily: 'serif'),),
        ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: newcontroller,
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: "New password",

                border: OutlineInputBorder(
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red ),
                ),
                prefixIcon: Icon(Icons.lock),
                prefixIconColor:Colors.red,
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: confirmcontroller,
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: "Confirm password",

                border: OutlineInputBorder(
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.red ),
                ),
                prefixIcon: Icon(Icons.lock),
                prefixIconColor:Colors.red,
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RoundButton(title: "Update Password", onPress: () async{
              if(newcontroller.text.isEmpty){
                utils().toastMassage("New Password is  empty");
              }else if(confirmcontroller.text.isEmpty){
                utils().toastMassage("Confirm Password is  empty");
              }else if(confirmcontroller.text==newcontroller.text){
                _auth.currentUser!.updatePassword(newcontroller.text.toString());
                utils().toastMassage("Password update");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    ProfileScreen()));
              }
              else{
                utils().toastMassage("Confirm Password is not match");
              }
            }),
          )
        ],
      ),
    );
  }
}
