import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:ssg_demo1/user/email_auth/login_screen.dart';
import 'package:ssg_demo1/user/home_screen.dart';

import '../../utils/utils.dart';
import '../models/user_model/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();


}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController cPasswordcontroller=TextEditingController();
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  void createAccount()async {
    String email=emailcontroller.text.trim();
    String name=namecontroller.text.trim();
    String password=passwordcontroller.text.trim();
    String cPassword=cPasswordcontroller.text.trim();
    if(email=="" || password=="" || cPassword=="") {
        log("please fill all the details.");
    }else if(password!=cPassword){
      //log("Password not match.");
      utils().toastMassage("Password not match.");
    }else{
      try{
        UserCredential userCredential= await FirebaseAuth.instance.
        createUserWithEmailAndPassword(email: email, password: password);
        //log("User created..");
        UserModel userModel=UserModel(id: userCredential.user!.uid, name: name, email: email,image: null);
        _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
        utils().toastMassage("User created...");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomBottomBar(),
          ),
        );
      }on FirebaseAuthException catch(ex){
        //log(ex.code.toString());
        utils().toastMassage(ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text("Sign up"),),
        backgroundColor:Colors.red,

      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: "Enter name..",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Enter email..",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: "Enter password..",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: cPasswordcontroller,
              decoration: InputDecoration(
                hintText: "Enter confirm password..",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            SizedBox(height: 12,),
            CupertinoButton(
               color: Colors.red,
                child: Text("Create Account"),
                onPressed: (){
                  createAccount();
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>LoginScreen())
                  );
                },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      )
    );
  }
}
