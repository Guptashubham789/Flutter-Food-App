import 'package:flutter/material.dart';
class AboutGupta extends StatefulWidget {
  const AboutGupta({super.key});

  @override
  State<AboutGupta> createState() => _AboutGuptaState();
}

class _AboutGuptaState extends State<AboutGupta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text("Welcome To Gupta Resturent",style: TextStyle(fontSize: 16,color: Colors.red),),
               Container(
                width: 500,
                height: 2,
                color: Colors.red,
              ),
              SizedBox(height: 12,),
              Card(
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Image.network('https://lh3.googleusercontent.com/p/AF1QipNkEeRmjY37mS2HVPNvh-8Z8nJ8dY6vYapJbdso=s1360-w1360-h1020',
                      height: 180,
                      width: 300,
                    ),
                    Text("since 2007",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Shop no.1,Malad Nadiyawala Colony 1 Malad West Mumbai Maharashtra 400064",style: TextStyle(color: Colors.red),),
                    )
                  ],
                ) ,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.network('https://guptabhelpuriandsandwich.web.app/images/owner.jpg',
                            height: 150,
                            width: 300,
                          ),
                          SizedBox(height: 5,),
                          Text("Prakash Gupta || Bablu Gupta",style: TextStyle(color: Colors.red),),SizedBox(height: 5,),
                          SizedBox(height: 5,),

                        ],
                      ) ,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
