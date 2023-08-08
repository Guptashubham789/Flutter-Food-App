import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{

  void toastMassage(String massage){
    Fluttertoast.showToast(
        msg: massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }

}