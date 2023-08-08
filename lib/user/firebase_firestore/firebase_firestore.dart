import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssg_demo1/user/models/category_model/category_model.dart';
import 'package:ssg_demo1/user/models/product_model/product_model.dart';
import 'package:ssg_demo1/user/models/user_model/user_model.dart';

import '../../utils/utils.dart';

class FirebaseFirestoreHelper{
  static FirebaseFirestoreHelper instance=FirebaseFirestoreHelper();

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //get category firebase
  Future<List<CategoryModel>> getCategories() async{
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot=
          await _firebaseFirestore.collection("categories").get();
      List<CategoryModel> categoriesList=querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
      return categoriesList;
    }catch (e){
      utils().toastMassage(e.toString());
      log(e.toString());
      return [];
    }
  }

  //get product firebase
  Future<List<ProductModel>> getBestProducts() async{
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot=
      await _firebaseFirestore.collectionGroup("products").get();
      List<ProductModel> productsList=querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productsList;
    }catch (e){
      utils().toastMassage(e.toString());
      log(e.toString());
      return [];
    }
  }

  //get category wise item show the category view firebase
  Future<List<ProductModel>> getCategoryProduct(String id) async{
    try{
      QuerySnapshot<Map<String,dynamic>> querySnapshot=
      await _firebaseFirestore.collection("categories").doc(id).collection("products").get();
      List<ProductModel> productsList=querySnapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();
      return productsList;
    }catch (e){
      utils().toastMassage(e.toString());
      log(e.toString());
      return [];
    }
  }

  Future<UserModel> getUserInformation() async{
    DocumentSnapshot<Map<String,dynamic>> querySnapshot=
    await _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();

    return UserModel.fromJson(querySnapshot.data()!);
  }
}

