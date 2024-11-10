import 'package:coffee_shop/Controller/startPageController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/screen/noInternetPage.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customImageAsset.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class coffeeshopstarttt extends StatelessWidget {
  const coffeeshopstarttt({super.key});

  @override
  Widget build(BuildContext context) {
    //final StartPageController controller = Get.find();
    return GetBuilder<StartPageController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (controller.connectionResult == ConnectivityResult.none ||
                    snapshot.data == ConnectivityResult.none)
                ? NoInternetPage(ReloadBtmOnPressed: () {
                    Get.offAll(() => coffeeshopstarttt());
                  })
                : Scaffold(
                    backgroundColor: theColors.lightblack2,
                    body: SafeArea(
                        child: Center(
                      child: ListView(children: [
                        Column(
                          children: [
                            Container(
                                height: 420,
                                width: 394,
                                child: CustomImageAsset(
                                  image: 'images/7.jpg',
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(height: 25),
                            CustomText(
                              color: theColors.white,
                              text: 'Coffee Shop',
                              fontWeight: FontWeight.bold,
                              fontsize: 24,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              color: theColors.white,
                              text: 'How do you like your coffee?',
                              fontsize: 16,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            CustomElevatedButton(
                              onPressed: () {
                                controller.signInWithGoogle();
                              },
                              child: CustomText(
                                color: theColors.white,
                                text: 'Enter Shop',
                                fontsize: 17,
                              ),
                              color: theColors.lightblack10,
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.fromLTRB(110, 19, 110, 19)),
                            ),
                          ],
                        ),
                      ]),
                    )));
          });
    });
  }
}
