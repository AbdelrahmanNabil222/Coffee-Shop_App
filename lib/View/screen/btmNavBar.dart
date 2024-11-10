import 'package:coffee_shop/Controller/btmNavBarController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/noInternetPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class btmnavbar extends StatelessWidget {
  const btmnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    //BtmNavBarController controller = Get.find();
    return GetBuilder<BtmNavBarController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (snapshot.data == ConnectivityResult.none ||
                    controller.connectivituresult == ConnectivityResult.none)
                ? NoInternetPage(ReloadBtmOnPressed: () {
                    Get.offAll(() => btmnavbar());
                  })
                : Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      selectedFontSize: 13,
                      iconSize: 23,
                      showUnselectedLabels: false,
                      selectedItemColor: theColors.deepOrange,
                      unselectedItemColor: theColors.deepgrey,
                      backgroundColor: theColors.black,
                      items: [
                        BottomNavigationBarItem(
                          label: 'Home',
                          icon: Icon(
                            theIcons.home,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: 'Cart',
                          icon: Icon(
                            theIcons.cart,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: 'FAV',
                          icon: Icon(
                            theIcons.heart,
                          ),
                        )
                      ],
                      onTap: (val) {
                        controller.btmNavBaronTap(val: val);
                      },
                      currentIndex: controller.selecttedd,
                    ),
                    body: controller.btmnavbarpages
                        .elementAt(controller.selecttedd));
          });
    });
  }
}
