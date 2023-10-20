import 'package:flutter/material.dart';
import 'package:ssg_demo1/widgets/round_button.dart';
class BuyProduct extends StatefulWidget {
  const BuyProduct({super.key});

  @override
  State<BuyProduct> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  int groupValue=2;
  @override
  Widget build(BuildContext context) {
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
                  Text("\$150",style: TextStyle(fontSize: 18,),)
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
        centerTitle: true,
        title: Text("CheckOut"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 35.0,),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,width: 3
                )
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(value: 1, groupValue: groupValue, onChanged: (value){
                    setState(() {
                      groupValue=value!;
                    });
                  }),
                  Icon(Icons.money),
                  SizedBox(width: 10,),
                  Text("Cash on Delivery",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor,width: 3
                  )
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(value: 2, groupValue: groupValue, onChanged: (value){
                    setState(() {
                      groupValue=value!;
                    });
                  }),
                  Icon(Icons.money),
                  SizedBox(width: 10,),
                  Text("Pay Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
