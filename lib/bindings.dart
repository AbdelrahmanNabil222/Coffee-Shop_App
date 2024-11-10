import 'package:coffee_shop/Controller/btmNavBarController.dart';
import 'package:coffee_shop/Controller/cappuccinoController.dart';
import 'package:coffee_shop/Controller/cart%20PageController.dart';
import 'package:coffee_shop/Controller/coffeeController.dart';
import 'package:coffee_shop/Controller/coldDrinksController.dart';
import 'package:coffee_shop/Controller/espressoController.dart';
import 'package:coffee_shop/Controller/favPageControler.dart';
import 'package:coffee_shop/Controller/homePageOfBtmNavBarController.dart';
import 'package:coffee_shop/Controller/modalBtmSheetOfBuyingController.dart';
import 'package:coffee_shop/Controller/searchDelegateController.dart';
import 'package:coffee_shop/Controller/splashScreenController.dart';
import 'package:coffee_shop/Controller/startPageController.dart';
import 'package:get/get.dart';

class bindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageOfBtmNavBarController(), fenix: true);
    Get.lazyPut(() => modalBtmSheetOfBuyingController(), fenix: true);
    Get.lazyPut(() => CuppuccinoController(), fenix: true);
    Get.lazyPut(() => EspressoController(), fenix: true);
    Get.lazyPut(() => CoffeeController(), fenix: true);
    Get.lazyPut(() => ColdDrinksController(), fenix: true);
    Get.lazyPut(() => CartPageController(), fenix: true);
    Get.lazyPut(() => StartPageController(), fenix: true);
    Get.lazyPut(() => BtmNavBarController(), fenix: true);
    Get.lazyPut(() => FavPageController(), fenix: true);
    Get.lazyPut(() => SearchDelegateController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
  }
}
