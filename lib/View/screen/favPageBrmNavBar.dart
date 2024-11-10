import 'package:coffee_shop/Controller/favPageControler.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/noInternetPage.dart';
import 'package:coffee_shop/View/screen/the%20product%20details.dart';
import 'package:coffee_shop/View/widgets/CustomNetworkImage.dart';
import 'package:coffee_shop/View/widgets/customContainer.dart';
import 'package:coffee_shop/View/widgets/customIconButton.dart';
import 'package:coffee_shop/View/widgets/customImageAsset.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:coffee_shop/View/widgets/customTextButton.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmNavBarFavorite extends StatelessWidget {
  BtmNavBarFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    //FavPageController controller = Get.find();
    return GetBuilder<FavPageController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (controller.connectionResult == ConnectivityResult.none ||
                    snapshot.data == ConnectivityResult.none)
                ? NoInternetPage(ReloadBtmOnPressed: () {
                    Get.off(() => BtmNavBarFavorite());
                  })
                : (controller.isloading == true)
                    ? Center(
                        child: CircularProgressIndicator(
                          color: theColors.lightblue,
                        ),
                      )
                    : Scaffold(
                        backgroundColor: theColors.deepGrey3,
                        appBar: AppBar(
                          iconTheme: IconThemeData(color: theColors.white),
                          backgroundColor: theColors.lightblack1,
                          title: CustomText(
                              text: 'Favorite', color: theColors.deepwhite),
                          actions: [
                            Container(
                              margin: EdgeInsets.only(right: 14),
                              child: CustomImageAsset(
                                  image: 'images/favorite.png',
                                  height: 22,
                                  width: 22,
                                  color: theColors.deepwhite2),
                            )
                          ],
                        ),
                        body: SafeArea(
                            child: ListView(
                          children: [
                            Center(
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                      controller.data.length,
                                      (i) => Stack(
                                            children: [
                                              CustomContainer(
                                                color: theColors.deepGrey2,
                                                width: 167,
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10, 7, 10, 10),
                                                      child: CustomNetworkImage(
                                                        height: 135,
                                                        width: double.infinity,
                                                        image:
                                                            '${controller.data[i]['image']}',
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              13, 0, 40, 0),
                                                      child: CustomText(
                                                        color: theColors.white,
                                                        text:
                                                            '${controller.data[i]['drinkname']}',
                                                        fontsize: 18,
                                                        hieght: 1.1,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(18, 10,
                                                                  0, 12),
                                                          child: CustomText(
                                                              text:
                                                                  '\$${controller.data[i]['smallsizeprice']}',
                                                              fontsize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: theColors
                                                                  .deepGrey3),
                                                        ),
                                                        CustomContainer(
                                                          color: theColors
                                                              .deepOrange,
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 9, 13, 10),
                                                          height: 26.5,
                                                          width: 29.5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              CustomAddTextButton(
                                                            onPressed: () {
                                                              Get.to(() => productdetails(
                                                                  drinkname:
                                                                      controller.data[i][
                                                                          'drinkname'],
                                                                  smalldrinkprice:
                                                                      controller.data[i][
                                                                          'smallsizeprice'],
                                                                  drinkphoto: controller
                                                                          .data[i]
                                                                      ['image'],
                                                                  drinkdescription:
                                                                      controller.data[i][
                                                                          'description'],
                                                                  mediumdrinkprice:
                                                                      controller.data[i]
                                                                          ['mediumsizeprice'],
                                                                  largedrinkprice: controller.data[i]['largesizeprice']));
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 53,
                                                  right: 4,
                                                  child: customIconButton(
                                                      onPressed: () {
                                                        //drink heart clicked
                                                        Get.defaultDialog(
                                                            textConfirm: 'Yes',
                                                            textCancel: 'No',
                                                            cancelTextColor:
                                                                theColors.black,
                                                            backgroundColor:
                                                                theColors.white,
                                                            buttonColor:
                                                                theColors.black,
                                                            title: 'remove ?',
                                                            titleStyle:
                                                                TextStyle(
                                                              fontSize: 18,
                                                              color: theColors
                                                                  .black,
                                                            ),
                                                            onCancel: () {
                                                              //close the default dialog
                                                              Get.back();
                                                            },
                                                            content: CustomText(
                                                                text:
                                                                    'Do you want to remove from favorite ?',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontsize: 15),
                                                            onConfirm:
                                                                () async {
                                                              // make the drink heart white in the home page
                                                              //if the type of drink is cappuccino in fav page
                                                              if (controller
                                                                          .data[i]
                                                                      [
                                                                      'type'] ==
                                                                  'cappuccino') {
                                                                //change the cappuccino Drink heart color in Home to white
                                                                controller.makeCappuccinoDrinkHeartColorWhiteInHome(
                                                                    drinkname: controller
                                                                            .data[i]
                                                                        [
                                                                        'drinkname']);
                                                              }
                                                              //if the type of drink is espresso in fav page
                                                              else if (controller
                                                                          .data[i]
                                                                      [
                                                                      'type'] ==
                                                                  'espresso') {
                                                                //change the espresso Drink heart color in Home to white
                                                                controller.makeEspressoDrinkHeartColorWhiteInHome(
                                                                    drinkname: controller
                                                                            .data[i]
                                                                        [
                                                                        'drinkname']);
                                                              }
                                                              //if the type of drink is coffee in fav page
                                                              else if (controller
                                                                          .data[i]
                                                                      [
                                                                      'type'] ==
                                                                  'coffee') {
                                                                //change the coffee Drink heart color in Home to white
                                                                controller.makeCoffeeDrinkHeartColorWhiteInHome(
                                                                    drinkname: controller
                                                                            .data[i]
                                                                        [
                                                                        'drinkname']);
                                                              }
                                                              //if the type of drink is cold drink  in fav page
                                                              else if (controller
                                                                          .data[i]
                                                                      [
                                                                      'type'] ==
                                                                  'colddrink') {
                                                                //change the colddrinks Drink heart color in Home to white

                                                                controller.makeColdDrinkdDrinkHeartColorWhiteInHome(
                                                                    drinkname: controller
                                                                            .data[i]
                                                                        [
                                                                        'drinkname']);
                                                              }
                                                              //the heart drink color clicked in fav page ,remove the drink from fav page
                                                              controller.favedDrinkHeartClicked(
                                                                  docid:
                                                                      controller
                                                                          .data[
                                                                              i]
                                                                          .id,
                                                                  drinknamee: controller
                                                                          .data[i]
                                                                      [
                                                                      'drinkname']);
                                                              //close the default
                                                              Get.back();
                                                            });
                                                      },
                                                      icon: CustomImageAsset(
                                                        image: theIcons.heart1,
                                                        height: 20,
                                                        width: 20,
                                                        color: Color(
                                                            controller.data[i]
                                                                ['heartcolor']),
                                                      ))),
                                            ],
                                          ))
                                ],
                              ),
                            ),
                          ],
                        )),
                      );
          });
    });
  }
}
