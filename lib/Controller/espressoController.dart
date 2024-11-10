import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EspressoController extends GetxController {
  //get espresso page data
  bool isloading = true;
  List espressodata = [];
  getespressodata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('coffeeshop')
        .doc('esspresso')
        .collection('espressodetails')
        .orderBy('number', descending: true)
        .get();
    espressodata.addAll(querySnapshot.docs);
    isloading = false;
    update();
  }

  //the drink heart clicked
  favbuttonClicked(
      {drinknamee,
      smallsizeprice,
      mediumsizeprice,
      largesizeprice,
      description,
      image,
      theDocClickedId,
      theDocHeartcolor}) {
    //if the heart color is white
    if (theDocHeartcolor == 4288716446) {
      Get.snackbar('it is added to Favorite', 'Faved',
          colorText: theColors.white, duration: Duration(seconds: 1));
// make the heart red
      CollectionReference heartColor = FirebaseFirestore.instance
          .collection('UsersEspressoFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      heartColor.doc(theDocClickedId).update({'color': 4289004548});
// Add to Favorite
      CollectionReference fav = FirebaseFirestore.instance
          .collection('Favorite')
          .doc('Faved')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('favorite')
          .collection('thefavorite');
      return fav
          .doc(drinknamee)
          .set({
            'heartcolor': 4289004548,
            'drinkname': drinknamee,
            'type': 'espresso',
            'smallsizeprice': smallsizeprice,
            'mediumsizeprice': mediumsizeprice,
            'largesizeprice': largesizeprice,
            'description': description,
            'image': image,
            'id': FirebaseAuth.instance.currentUser!.uid,
            'email': FirebaseAuth.instance.currentUser!.email,
            'whenadded': DateTime.now().toString()
          })
          .then((value) => print("Added"))
          .catchError((error) => print("Failed to add: $error"));
    }
    //if the heart color is red
    else if (theDocHeartcolor == 4289004548) {
// make the heart white
      CollectionReference heartColor = FirebaseFirestore.instance
          .collection('UsersEspressoFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      heartColor.doc(theDocClickedId).update({'color': 4288716446});
// remove from favorite
      FirebaseFirestore.instance
          .collection('Favorite')
          .doc('Faved')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('favorite')
          .collection('thefavorite')
          .doc(drinknamee)
          .delete();
      Get.snackbar('it is removed from Favorite', 'removed',
          colorText: theColors.white, duration: Duration(seconds: 1));
    }
  }

  @override
  void onInit() {
    getespressodata();
    super.onInit();
  }
}
