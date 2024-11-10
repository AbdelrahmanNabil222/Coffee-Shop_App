import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ColdDrinksController extends GetxController {
  //get cold drinks page data
  bool isloading = true;
  List colddrinksdata = [];
  getcolddrinksdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('coffeeshop')
        .doc('colddrinks')
        .collection('colddrinksdetails')
        .orderBy('number', descending: true)
        .get();
    colddrinksdata.addAll(querySnapshot.docs);
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
          .collection('UsersColdDrinksFavHeartColors')
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
            'smallsizeprice': smallsizeprice,
            'mediumsizeprice': mediumsizeprice,
            'type': 'colddrink',
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
          .collection('UsersColdDrinksFavHeartColors')
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
    getcolddrinksdata();
    super.onInit();
  }
}
