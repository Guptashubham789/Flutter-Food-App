import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/provider/app_provider.dart';
import 'package:ssg_demo1/user/cart_screen/cart_screen.dart';
import 'package:ssg_demo1/user/favorite_screen/favorite_screen.dart';
import 'package:ssg_demo1/user/models/product_model/product_model.dart';
import 'package:ssg_demo1/utils/utils.dart';

import '../buy_product_screen/buy_product.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key,required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty=1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.singleProduct.name),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>CartScreen())
                );
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Image.network(widget.singleProduct.image,
            height: 400,
            width: 400,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.singleProduct.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    widget.singleProduct.isFavourite=!widget.singleProduct.isFavourite;
                  });
                  if(widget.singleProduct.isFavourite){
                    AppProvider appProvider=Provider.of<AppProvider>(context,listen:false);
                    appProvider.addFavrtProductList(widget.singleProduct);
                  }else{
                    AppProvider appProvider=Provider.of<AppProvider>(context,listen:false);
                    appProvider.removeFavrtProductList(widget.singleProduct);
                  }
                }, icon:Icon(appProvider.getFavrtProductList.contains(widget.singleProduct)?Icons.favorite:Icons.favorite_border,color: Colors.red,))
              ],
            ),
            //Text(widget.singleProduct.description),
            SizedBox(height: 10,),
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    if(qty>=1){
                      setState(() {
                        qty--;
                      });
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 12,),
                Text(qty.toString(),style: TextStyle(fontSize: 18),),
                SizedBox(width: 12,),
                CupertinoButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: (){
                      AppProvider appProvider=Provider.of<AppProvider>(context,listen:false);
                     ProductModel productModel= widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      utils().toastMassage("Added to Cart");
                    },
                    child: Text("ADD TO CART",style: TextStyle(color: Colors.red),)
                ),
                SizedBox(width: 20,),
                SizedBox(
                  height: 36,
                  width: 140,

                  child: ElevatedButton(

                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>BuyProduct())
                        );
                      },
                      child: Text("BUY")
                  ),
                )
              ],
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
