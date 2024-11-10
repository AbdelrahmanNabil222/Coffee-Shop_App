import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  //remove the order from cart
  deletetheorder({docid}) async {
    Get.back();
    await FirebaseFirestore.instance.collection('orders').doc(docid).delete();
  }

  // increment the amount of order
  incraseAmout({docid}) async {
    CollectionReference decrevalue =
        await FirebaseFirestore.instance.collection('orders');
    decrevalue.doc(docid).update({'amount': FieldValue.increment(1)});
  }

  // decrement the amount of order
  decrementamount({docid}) async {
    CollectionReference decrevalue =
        await FirebaseFirestore.instance.collection('orders');
    decrevalue.doc(docid).update({'amount': FieldValue.increment(-1)});
  }
}
