import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/user/cart_screen/widgets/single_cart_list.dart';

import '../../provider/app_provider.dart';
import '../../widgets/round_button.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider=Provider.of<AppProvider>(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total: ",style: TextStyle(fontSize: 18,),),
                  Text("\$${appProvider.totalPrice().toString()}",style: TextStyle(fontSize: 18,),)
                ],
              ),
              SizedBox(height: 10,),
              RoundButton(title: "Checkout", onPress: (){})
            ],
          ),
        ),
      ),
      appBar: AppBar(

        backgroundColor: Colors.red,
        title: Center(child: Text("Cart"),),
      ),
      body: appProvider.getCartProductList.isEmpty?Center(child: Text("Empty cart."),) : ListView.builder(
        itemCount: appProvider.getCartProductList.length,
          padding: EdgeInsets.all(12),
          itemBuilder: (ctx,index){
            return  SingleCartItem(singleProduct:appProvider.getCartProductList[index] ,);
          }),
    );
  }
}
