import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/View/screen/splash%20Screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StartPageController extends GetxController {
  // internet check function
  var connectionResult;
  internetstatus() async {
    connectionResult = await Connectivity().checkConnectivity();
    update();
  }

  // sign up with google
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleUser == null) {
      return;
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    docolorsfunctios();
    Get.off(() => Splashscreen());
  }

  //i put the functions of drinks hearts colors in another function for clean code, when i signup the colors of drinks hearts will add
  docolorsfunctios() {
    addUserCappuccinoFavHeartColors();
    addUserCoffeeFavHeartColors();
    addUserColdDrinkFavHeartColors();
    addUserEspressoFavHeartColors();
  }

  // add colors to drinks hearts by user when signup
  //list of drinks name
  List CappuccinoDrinksName = [
    {'drinkname': 'Cappuccino with milk'},
    {'drinkname': 'Cappuccino chocolate'}
  ];
  //giving number to every drink
  List CappuccinoDrinkNumber = [
    0,
    1,
  ];
  addUserCappuccinoFavHeartColors() async {
    //i will check if the products that i want to add a colors to it ,had been added a color to it before or not
    //so get the doc that i added when i added a documents of hearts colors when the user signup
    final querySnapshot = await FirebaseFirestore.instance
        .collection('UsersCappuccinoFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors')
        .doc('done')
        .get();
    // if you found this doc
    if (querySnapshot.exists) {
      //return false
      return false;
    }
    //if you dont found it
    else {
      //add the doc and add a drinks heart colors documents
      CollectionReference users = FirebaseFirestore.instance
          .collection('UsersCappuccinoFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      users.doc('done').set({'x': 1});
      int i = 0;
      //add two color document to two drink
      while (i < CappuccinoDrinksName.length) {
        users
            .doc(CappuccinoDrinksName[i]['drinkname'])
            .set({
              'color': 4288716446,
              'id': FirebaseAuth.instance.currentUser!.uid,
              'number': CappuccinoDrinkNumber[i]
            })
            .then((value) => print("Added"))
            .catchError((error) => print("Failed to add : $error"));
        i++;
      }
    }
  }

  // add colors to drinks hearts by user when signup
  //list of drinks name
  List EspressoDrinksName = [
    {'drinkname': "Doppio espresso"},
    {'drinkname': "Normal Espresso"},
    {'drinkname': "Flatwhite espresso"},
  ];
  //giving number to every drink
  List EspressoDrinkNumber = [0, 1, 2];
  addUserEspressoFavHeartColors() async {
    //i will check if the products that i want to add a colors to it ,had been added a color to it before or not
    //so get the doc that i added when i added a documents of hearts colors when the user signup
    final querySnapshot = await FirebaseFirestore.instance
        .collection('UsersEspressoFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors')
        .doc('done')
        .get();
    // if you found this doc
    if (querySnapshot.exists) {
      //return false
      return false;
    }
    //if you dont found it
    else {
      //add the doc and add a drinks heart colors documents
      CollectionReference users = FirebaseFirestore.instance
          .collection('UsersEspressoFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      users.doc('done').set({'x': 1});
      int i = 0;
      //add three color document to three drink
      while (i < EspressoDrinksName.length) {
        users
            .doc(EspressoDrinksName[i]['drinkname'])
            .set({
              'color': 4288716446,
              'id': FirebaseAuth.instance.currentUser!.uid,
              'number': EspressoDrinkNumber[i],
            })
            .then((value) => print("Added"))
            .catchError((error) => print("Failed to add : $error"));
        i++;
      }
    }
  }

  // add colors to drinks hearts by user when signup
  //list of drinks name
  List CoffeeDrinksName = [
    {'drinkname': "Its Coffee black"},
    {'drinkname': "Coffee with Milk"},
    {'drinkname': "Brazilian Coffee"},
    {'drinkname': "Ethiopian Coffee"},
    {'drinkname': "Turkish Coffee"},
    {'drinkname': "Yameni Coffee"}
  ];
  //giving number to every drink
  List CoffeeDrinkNumber = [0, 1, 2, 3, 4, 5];

  addUserCoffeeFavHeartColors() async {
    //i will check if the products that i want to add a colors to it ,had been added a color to it before or not
    //so get the doc that i added when i added a documents of hearts colors when the user signup
    final querySnapshot = await FirebaseFirestore.instance
        .collection('UserCoffeeFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors')
        .doc('done')
        .get();
    // if you found this doc
    if (querySnapshot.exists) {
      //return false
      return false;
    }
    //if you dont found it
    else {
      //add the doc and add a drinks heart colors documents
      CollectionReference users = FirebaseFirestore.instance
          .collection('UsersCoffeeFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      users.doc('done').set({'x': 1});
      int i = 0;
      //add six color document to six drink
      while (i < CoffeeDrinksName.length) {
        users
            .doc(CoffeeDrinksName[i]['drinkname'])
            .set({
              'color': 4288716446,
              'id': FirebaseAuth.instance.currentUser!.uid,
              'number': CoffeeDrinkNumber[i]
            })
            .then((value) => print("Added"))
            .catchError((error) => print("Failed to add : $error"));
        i++;
      }
    }
  }

  // add colors to drinks hearts by user when signup
  //list of drinks name
  List ColdDrinkDrinksName = [
    {'drinkname': "Watermelon Fresh juice"},
    {'drinkname': "Beach Fresh juice"},
    {'drinkname': "Lemon With Minit"},
    {'drinkname': "Minit fresh juice"},
    {'drinkname': "Orange Fresh juice"},
    {'drinkname': "pomegranate Fresh juice"},
    {'drinkname': "Strawberry Fresh juice"},
  ];
  //giving number to every drink
  List ColdDrinksDrinkNumber = [0, 1, 2, 3, 4, 5, 6];
  addUserColdDrinkFavHeartColors() async {
    //i will check if the products that i want to add a colors to it ,had been added a color to it before or not
    //so get the doc that i added when i added a documents of hearts colors when the user signup
    final querySnapshot = await FirebaseFirestore.instance
        .collection('UsersColdDrinksFavHeartColors')
        .doc('colors')
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc('thecolors')
        .collection('thecolors')
        .doc('done')
        .get();
    // if you found this doc
    if (querySnapshot.exists) {
      //return false
      return false;
    }
    //if you dont found it
    else {
      //add the doc and add a drinks heart colors documents
      CollectionReference users = FirebaseFirestore.instance
          .collection('UsersColdDrinksFavHeartColors')
          .doc('colors')
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc('thecolors')
          .collection('thecolors');
      users.doc('done').set({'x': 1});
      int i = 0;
      //add seven color document to seven drink
      while (i < ColdDrinkDrinksName.length) {
        users
            .doc(ColdDrinkDrinksName[i]['drinkname'])
            .set({
              'color': 4288716446,
              'id': FirebaseAuth.instance.currentUser!.uid,
              'number': ColdDrinksDrinkNumber[i]
            })
            .then((value) => print("Added"))
            .catchError((error) => print("Failed to add : $error"));
        i++;
      }
    }
  }

  @override
  void onInit() {
    internetstatus();
    super.onInit();
  }
}
