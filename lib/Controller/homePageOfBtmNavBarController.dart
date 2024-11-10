import 'package:coffee_shop/View/screen/startPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePageOfBtmNavBarController extends GetxController {
  // sign out function
  signout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    Get.offAll(() => coffeeshopstarttt());
  }
}
