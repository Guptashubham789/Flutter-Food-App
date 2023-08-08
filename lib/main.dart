import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/provider/app_provider.dart';
import 'package:ssg_demo1/user/custom_bottom_bar/custom_bottom_bar.dart';

import 'package:ssg_demo1/user/email_auth/sign_screen.dart';
import 'package:ssg_demo1/user/home_screen.dart';
import 'package:ssg_demo1/user/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser !=null) ? CustomBottomBar() : Welcome(),
      ),
    );
  }
}
