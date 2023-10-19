import 'package:flutter/material.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.red,
        title: Center(child: Text("Your Orders",style: TextStyle(color: Colors.white,fontFamily: 'serif'),)),
      ),
    );
  }
}
