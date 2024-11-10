import 'package:coffee_shop/Controller/splashScreenController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (controller) {
      return Scaffold(
        backgroundColor: theColors.lightblack1,
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            CustomText(
              text: 'Coffee shop is loading...',
              fontsize: 25,
              color: theColors.white,
            ),
            SizedBox(
              height: 140,
            ),
            CircularProgressIndicator(
              color: theColors.white,
            ),
          ],
        ))),
      );
    });
  }
}
