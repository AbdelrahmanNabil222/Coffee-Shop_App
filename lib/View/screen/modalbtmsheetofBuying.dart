import 'package:coffee_shop/Controller/modalBtmSheetOfBuyingController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/widgets/customDivider.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelbtmSheetOfBuying extends StatelessWidget {
  const ModelbtmSheetOfBuying({super.key});

  @override
  Widget build(BuildContext context) {
    // final modalBtmSheetOfBuyingController controller = Get.find();
    return GetBuilder<modalBtmSheetOfBuyingController>(builder: (controller) {
      return Column(
        children: [
          SizedBox(
            width: 70,
            child: CustomDivider(
              thickness: 3,
              color: theColors.grey,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                  text: 'Number of purchases',
                  color: theColors.deepGrey1,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 102,
                ),
                CustomText(
                  text: '${controller.totalamount.toString()}',
                  color: theColors.black,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                  text: 'Sub-Total',
                  color: theColors.deepGrey1,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 171,
                ),
                CustomText(
                  text: '${'\$'}${controller.totalprices.toString()}',
                  color: theColors.black,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: 'Water',
                    color: theColors.deepGrey1,
                    fontsize: 16,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 200,
                ),
                CustomText(
                  text: '\$5.00',
                  color: theColors.black,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                  text: 'Discount',
                  color: theColors.deepGrey1,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 178,
                ),
                CustomText(
                  text: '\$2.00',
                  color: theColors.black,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              child: CustomDivider(thickness: 1, color: theColors.deepGrey2),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                  text: 'Total Cost',
                  color: theColors.deepGrey1,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 160,
                ),
                CustomText(
                  text: '\$${controller.totalcost.toString()}',
                  color: theColors.black,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 95,
          ),
          CustomElevatedButton(
              onPressed: () {},
              child: CustomText(
                text: 'Proceed to Checkout',
                fontsize: 15,
                color: theColors.white,
              ),
              color: theColors.black,
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(70, 10, 70, 10))),
        ],
      );
    });
  }
}
