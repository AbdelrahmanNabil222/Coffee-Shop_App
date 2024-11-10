import 'package:coffee_shop/View/screen/cartpageofbtmnavbar.dart';
import 'package:coffee_shop/View/screen/favPageBrmNavBar.dart';
import 'package:coffee_shop/View/screen/homePageOfBtmNavBar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class BtmNavBarController extends GetxController {
  int selecttedd = 0;
  //list of pages of btm nav bar
  List btmnavbarpages = [btmnavbarHome(), btmnavbarCart(), BtmNavBarFavorite()];
  //btm Nav bar onTaped Function
  btmNavBaronTap({val}) {
    selecttedd = val;
    update();
  }

  //internet function
  var connectivituresult;
  checkconnectivity() async {
    connectivituresult = await Connectivity().checkConnectivity();
    update();
  }

  @override
  void onInit() {
    checkconnectivity();
    super.onInit();
  }
}
