import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customImageAsset.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key, required this.ReloadBtmOnPressed});
  final void Function()? ReloadBtmOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: theColors.deepwhite,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageAsset(
            image: 'images/internet.PNG',
            fit: BoxFit.fill,
            //width: double.infinity,
          ),
          SizedBox(height: 50),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CustomText(
                text:
                    'No internet connection found, check your connection and try again.',
                textAlign: TextAlign.center,
                fontsize: 15,
                color: theColors.black,
              )),
          SizedBox(height: 35),
          CustomElevatedButton(
            onPressed: ReloadBtmOnPressed,
            child: CustomText(text: 'Reload', color: theColors.white),
            color: theColors.deepGrey1,
            padding:
                MaterialStateProperty.all(EdgeInsets.fromLTRB(60, 10, 60, 10)),
          ),
        ])));
  }
}
