import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/email_auth/login_screen.dart';
import 'package:ssg_demo1/user/email_auth/sign_screen.dart';

import '../widgets/top_titles/top_title.dart';
//import 'package:guptashop/constants/assets_images.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitles(
                  title: "Welcome", subtitle: " Buy any food from using app"),
              Center(
                child: Image.network('https://lh3.googleusercontent.com/p/AF1QipNkEeRmjY37mS2HVPNvh-8Z8nJ8dY6vYapJbdso=s1360-w1360-h1020',
                  height: 300,
                  width: 300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.facebook,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.key,
                    size: 35,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),

                  SizedBox(
                    width: 400,
                    child: CupertinoButton(
                        color: Colors.red,

                        child: Text("SignUp"),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>SignUpScreen())
                          );
                        }
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(

                    width: 400,
                    child: CupertinoButton(
                        color: Colors.red,
                        child: Text("Login"),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>LoginScreen())
                          );
                        }
                    ),
                  ),



              const SizedBox(
                height: 12,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
