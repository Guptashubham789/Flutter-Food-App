

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/about_gupta_screen/about_screen.dart';
import 'package:ssg_demo1/constants/routes.dart';
import 'package:ssg_demo1/provider/app_provider.dart';
import 'package:ssg_demo1/user/category_view/category_view.dart';
import 'package:ssg_demo1/user/email_auth/login_screen.dart';
import 'package:ssg_demo1/user/firebase_firestore/firebase_firestore.dart';
import 'package:ssg_demo1/user/product_detail/product_details.dart';
import 'package:ssg_demo1/user/welcome.dart';

import '../utils/utils.dart';
import '../widgets/top_titles/top_title.dart';
import 'models/category_model/category_model.dart';
import 'models/product_model/product_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final _auth=FirebaseAuth.instance;
  ThemeData themeData= ThemeData();

  List<CategoryModel> categoriesList=[];
  List<ProductModel> productsList=[];

  bool isLoading=false;
  void initState(){
    AppProvider appProvider=Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfoFirebase();
    getCategoriesList();
    super.initState();
  }
  void getCategoriesList() async {
    setState(() {
      isLoading=true;
    });

    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productsList = await FirebaseFirestoreHelper.instance.getBestProducts();
    productsList.shuffle();
    //this function random the item
    //categoriesList.shuffle();
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gupta since 2007"),
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> AboutGupta()));
          }, icon: Icon(Icons.info_outline)),
          IconButton(onPressed: (){
            _auth.signOut().then((value) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> Welcome()));
              utils().toastMassage("Logout");
              setState(() {

              });
            }).onError((error, stackTrace) {
              utils().toastMassage(error.toString());
            });
          }, icon:Icon(Icons.logout_outlined)),
          //

        ],

      ),
      body: isLoading?Center(child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search..",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Categories",
              style: TextStyle(fontSize: 18.0,
              fontWeight: FontWeight.bold),),
            ),
            categoriesList.isEmpty?Center(child: Text("Categories is empaty"),):SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList.map((e) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          CategoryView(categoryModel: e,),));
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(e.image),
                              ),
                          Center(
                            child: Text(e.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,fontStyle: FontStyle.italic,color: Colors.red),),
                          )
                        ],
                      ),


                    ),
                  ),
                )).toList(),
              ),

            ),
            const Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Top items",
                style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold),),
            ),

            productsList.isEmpty?Center(child: Text("Items  is empaty"),):Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                itemCount: productsList.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (ctx,index){
                  ProductModel singleProduct=productsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2) ,
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.network(singleProduct.image,height: 100,width: 100,),
                          SizedBox(
                            height: 3,
                          ),
                          Text(singleProduct.name),
                          Text("Price: ${singleProduct.price}"),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 45,
                            width: 120,
                            child: OutlinedButton(

                                  style: OutlinedButton.styleFrom(
                                      primary: Colors.red,
                                      side: const BorderSide(
                                          color: Colors.red,
                                          width: 1.1
                                      )
                                  ),

                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  ProductDetails(singleProduct: singleProduct,),));
                                },
                                child: const Text(

                                  "Buy",style: TextStyle(color:Colors.red),)),
                          )
                        ],
                      ),
                    ),
                  );
              }),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );



  }
}
//map is datatype h jisme key aur value likh sakte hai jo key hota hai vh string hoga aur value dynamic hogi

