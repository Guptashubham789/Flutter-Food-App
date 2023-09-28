import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/user/edit_profile/edit_profile_screen.dart';

import '../../provider/app_provider.dart';
import '../../utils/utils.dart';
import '../welcome.dart';

class ProfileScreen extends StatefulWidget {
  const  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("Account"),),

      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Column(
                  children:  [
                    SizedBox(height: 10,),
                    appProvider.getUserInformation.image==null?
                    Icon(Icons.person_2_outlined,size: 115,)
                        :Image.network(appProvider.getUserInformation.image!,height: 100,width: 200,fit: BoxFit.cover,),
                    Text(appProvider.getUserInformation.name,
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    Text(appProvider.getUserInformation.email),
                    SizedBox(height: 5,),
                    SizedBox(
                      height: 50,
                      child: CupertinoButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            );
                          },
                          child: Text("Edit"),

                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children:
                [
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text("Your Order"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Favourite"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.info_outline),
                    title: Text("About us"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.support),
                    title: Text("Support"),
                  ),
                  ListTile(
                    onTap: (){
                      _auth.signOut().then((value) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        //Navigator.push(context, CupertinoPageRoute(builder: (context)=> Welcome()));
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context)=>Welcome())
                        );
                        utils().toastMassage("Logout");
                      }).onError((error, stackTrace) {
                        utils().toastMassage(error.toString());
                      });
                    },
                    leading: Icon(Icons.login_outlined),
                    title: Text("Logout"),
                  ),
                  SizedBox(height: 12,),
                  Text("Version 1.0.0")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
