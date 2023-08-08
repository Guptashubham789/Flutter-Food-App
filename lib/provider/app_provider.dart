import 'package:flutter/cupertino.dart';
import 'package:ssg_demo1/user/firebase_firestore/firebase_firestore.dart';
import 'package:ssg_demo1/user/models/user_model/user_model.dart';

import '../user/models/product_model/product_model.dart';

class AppProvider with ChangeNotifier{

  //Cart screen product add and remove with provider
  final List<ProductModel> _cartProductList=[];
  UserModel? _userModel;
  UserModel get getUserInformation => _userModel!;

  void addCartProduct(ProductModel productModel){
    _cartProductList.add(productModel);
    notifyListeners();
  }

  void removeCartProduct(ProductModel productModel){
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;

  //Favrt screen product add and remove with provider
  final List<ProductModel> _favrtProductList=[];
  void addFavrtProductList(ProductModel productModel){
    _favrtProductList.add(productModel);
    notifyListeners();
  }

  void removeFavrtProductList(ProductModel productModel){
    _favrtProductList.remove(productModel);
    notifyListeners();
  }
  List<ProductModel> get getFavrtProductList => _favrtProductList;

//user get tha information
  void getUserInfoFirebase() async{
  _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
  notifyListeners();
  }
  ////user information



}