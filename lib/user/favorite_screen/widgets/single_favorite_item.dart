import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssg_demo1/user/models/product_model/product_model.dart';

import '../../../provider/app_provider.dart';
import '../../../utils/utils.dart';
class SingleFavoriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavoriteItem({super.key,required this.singleProduct});

  @override
  State<SingleFavoriteItem> createState() => _SingleFavoriteItemState();
}

class _SingleFavoriteItemState extends State<SingleFavoriteItem> {
  //int qty=0;
  @override
  // void initState() {
  //   qty=widget.singleProduct.qty??0;
  //   setState(() {
  //
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(

        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.1),
              child:Image.network(widget.singleProduct.image,height: 100,width: 100,)
              ,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              flex: 2,
              child: SizedBox(
                height: 140,

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.singleProduct.name,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold),),

                          Row(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                                  AppProvider appProvider=Provider.of<AppProvider>(context,listen:false);
                                  appProvider.removeFavrtProductList(widget.singleProduct);
                                  //utils().toastMassage("Removed to wishlist");
                                },
                                child: const Text("Remove To wishlist",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.red),),
                              ),
                              SizedBox(width: 10,),

                            ],
                          )
                        ],
                      ),
                      Text("Rs: ${widget.singleProduct.price.toString()}"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.red,width: 1.3),
      ),
    );
  }
}
