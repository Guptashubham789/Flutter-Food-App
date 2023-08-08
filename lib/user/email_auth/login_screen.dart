import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/email_auth/sign_screen.dart';
import 'package:ssg_demo1/user/home_screen.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final _auth=FirebaseAuth.instance;


  Future<void> login() async {
  String email=emailcontroller.text.trim();
  String password=passwordcontroller.text.trim();
  if(email=="" || password==""){
    utils().toastMassage("please fill all the details.");
  }else{
    try{
      UserCredential userCredential= await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);
      if(UserCredential != null){
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> HomeScreen()));
        utils().toastMassage("Login successfully.");
      }
    } on FirebaseException catch(ex){
      utils().toastMassage(ex.toString());
    }
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Center(child: Text("Login"),),
        backgroundColor:Colors.red,


      ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter email..",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 12,),
              TextField(
                keyboardType:TextInputType.text,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: "Enter password..",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password_outlined),
                ),
              ),
              SizedBox(height: 12,),

              SizedBox(height: 12,),
              SizedBox(
                width: 400,
                child: CupertinoButton(
                    color: Colors.red,
                    child: Text("Login"),

                    onPressed: (){
                      login();
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=>SignUpScreen())
                    );
                  },

                      child: Text("Sign up"))
                ],
              ),
            ],
          ),
        )

    );
  }
}
