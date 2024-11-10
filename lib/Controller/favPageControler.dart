import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavPageController extends GetxController {
  bool isloading = true;
  //internet check function
  var connectionResult;
  checkinternet() async {
    connectionResult = await Connectivity().checkConnectivity();
    update();
  }

//get fav page data
  List data = [];
  getfavData() async {
    isloading = true;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Favorite')
        .doc('Faved')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('favorite')
        .collection('thefavorite')
        .orderBy('whenadded', descending: true)
        .get();
    data.addAll(querySnapshot.docs);
    isloading = false;
    update();
  }

  //drink heart clicked in fav page
  favedDrinkHeartClicked({
    docid,
    drinknamee,
  }) async {
// delete the faved drink from favorite page
    await FirebaseFirestore.instance
        .collection('Favorite')
        .doc('Faved')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('favorite')
        .collection('thefavorite')
        .doc(docid)
        .delete();
    Get.snackbar('it is removed from favorite', 'removed',
        colorText: theColors.white, duration: Duration(seconds: 1));
  }

  //change the cappuccino Drink heart color in Home to white
  makeCappuccinoDrinkHeartColorWhiteInHome({drinkname}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('UsersCappuccinoFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors');

    return color
        .doc(drinkname)
        .update({'color': 4288716446})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //change the espresso Drink heart color in Home to white
  makeEspressoDrinkHeartColorWhiteInHome({drinkname}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('UsersEspressoFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors');

    return color
        .doc(drinkname)
        .update({'color': 4288716446})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //change the coffee Drink heart color in Home to white
  makeCoffeeDrinkHeartColorWhiteInHome({drinkname}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('UsersCoffeeFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors');

    return color
        .doc(drinkname)
        .update({'color': 4288716446})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //change the cold drinks Drink heart color in Home to white
  makeColdDrinkdDrinkHeartColorWhiteInHome({drinkname}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('UsersColdDrinksFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors');

    return color
        .doc(drinkname)
        .update({'color': 4288716446})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void onInit() {
    checkinternet();
    getfavData();
    super.onInit();
  }
}
