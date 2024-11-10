import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class modalBtmSheetOfBuyingController extends GetxController {
  double totalprices = 0;
  double totalamount = 0;
  double totalcost = 0;
  //get total number of purchases and total price
  getTotalAmountAndPrice() async {
    double totalpricess = 0;
    double totalamountt = 0;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var fields in querySnapshot.docs) {
      totalamountt += fields['amount'];

      totalpricess += (double.parse(fields['amount'].toString()) *
          double.parse(fields['price'].toString()));
    }
    totalprices = totalpricess;
    totalamount = totalamountt;
    //get total cost
    totalcost = (totalpricess + 5 - 2);
    update();
  }

  @override
  void onInit() {
    getTotalAmountAndPrice();
    super.onInit();
  }
}
