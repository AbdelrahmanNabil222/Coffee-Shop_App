import 'package:coffee_shop/View/screen/btmNavBar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void splashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    FlutterNativeSplash.remove();
    Get.off(() => btmnavbar());
  }

  @override
  void onInit() {
    splashScreen();
    super.onInit();
  }
}
