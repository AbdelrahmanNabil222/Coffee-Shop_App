import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TheProductDetailsController extends GetxController {
  TheProductDetailsController({required this.drinkName});
  String? size;
  String pricefield = '0';
  String pricefieldcart = '0';
  double currentvalue = 0;
  String? dropdownvalue;
  TextEditingController fieldcontroller = TextEditingController();
  var connectivityResultt;
  double theUserRating = 0;

  //check internet function
  checkInternet() async {
    connectivityResultt = Connectivity().checkConnectivity();
    update();
  }

  //add the drink rate by user function
  CollectionReference users = FirebaseFirestore.instance
      .collection('UsersRating')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('userRate');

  UserRate({userRate, drinkname}) {
    return users
        .doc(drinkname)
        .set({
          "rate": userRate,
          'drinkname': drinkname,
          'id': FirebaseAuth.instance.currentUser!.uid
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  
  //get drink rate data
  var drinkName;
  List data = [];
  getuserRate() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('UsersRating')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('userRate')
        .where('drinkname', isEqualTo: drinkName)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    update();
  }

  // list of the dropDownButton
  var items = [
    'C.D.',
    '0.0',
    '0.5',
    '1.0',
    '1.5',
    '2.0',
    '2.5',
    '3.0',
    '3.5',
    '4.0',
    '4.5',
    '5.0',
    '5.5',
    '6.0'
  ];
  // the function of the dropDownButton
  onChangedDropDown(String? newValue) {
    dropdownvalue = newValue;
    update();
  }

  // the function of the Radio Button
  onChangedRadio(val) {
    size = val;
    update();
  }

// add the order to cart Function
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  addOrder(String? drinkname) {
    return orders
        .add({
          'amount': 1,
          'drink name': drinkname,
          'size': size,
          'price': pricefield,
          'sugar': dropdownvalue,
          'table number': fieldcontroller.text,
          'orderDate': DateTime.now().toString(),
          'id': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



  @override
  void onInit() {
    checkInternet();
    getuserRate();
    super.onInit();
  }
}
