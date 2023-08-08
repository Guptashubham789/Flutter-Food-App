import 'package:flutter/material.dart';

import '../firebase_firestore/firebase_firestore.dart';
import '../models/category_model/category_model.dart';
import '../models/product_model/product_model.dart';
import '../product_detail/product_details.dart';
class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key,required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productsList=[];
  bool isLoading=false;
  void initState(){
    getCategoriesList();
    super.initState();
  }
  void getCategoriesList() async {
    setState(() {
      isLoading=true;
    });

    productsList = await FirebaseFirestoreHelper.instance.getCategoryProduct(widget.categoryModel.id);
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
        title: Text(widget.categoryModel.name),
      ),
      body: isLoading?Center(child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),) :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            productsList.isEmpty?Center(child: Text("Items  is empaty"),):Padding(
              padding: const EdgeInsets.all(1.0),
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
