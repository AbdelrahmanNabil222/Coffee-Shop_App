import 'package:coffee_shop/Controller/theProductDetailsController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/btmNavBar.dart';
import 'package:coffee_shop/View/screen/noInternetPage.dart';
import 'package:coffee_shop/View/widgets/CustomNetworkImage.dart';
import 'package:coffee_shop/View/widgets/customAlertDalogOfRatring.dart';
import 'package:coffee_shop/View/widgets/customAlertDialog.dart';
import 'package:coffee_shop/View/widgets/customContainer.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customIconButton.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class productdetails extends StatelessWidget {
  const productdetails(
      {super.key,
      this.drinkname,
      this.smalldrinkprice,
      this.drinkphoto,
      this.drinkdescription,
      this.mediumdrinkprice,
      this.largedrinkprice});
  final String? drinkname;
  final String? smalldrinkprice;
  final String? mediumdrinkprice;
  final String? largedrinkprice;
  final String? drinkphoto;
  final String? drinkdescription;

  @override
  Widget build(BuildContext context) {
    final TheProductDetailsController controllerr =
        Get.put(TheProductDetailsController(drinkName: drinkname));
    return GetBuilder<TheProductDetailsController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (snapshot.data == ConnectivityResult.none ||
                    controller.connectivityResultt == ConnectivityResult.none)
                ? NoInternetPage(ReloadBtmOnPressed: () {
                    Get.off(() => productdetails());
                  })
                : Scaffold(
                    backgroundColor: theColors.black,
                    body: SafeArea(
                        child: Center(
                      child: ListView(shrinkWrap: true, children: [
                        Stack(
                          children: [
                            Positioned(
                              child: CustomNetworkImage(
                                height: 370,
                                width: double.infinity,
                                image: '$drinkphoto',
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 5,
                              child: customIconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: theColors.blueAccent2),
                              ),
                            ),
                            Positioned(
                                top: 265,
                                left: 1,
                                right: 1,
                                child: CustomContainer(
                                    height: 140,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(40),
                                    color: theColors.lightblack3,
                                    child: Row(children: [
                                      Column(
                                        children: [
                                          CustomContainer(
                                            width: 140,
                                            margin: EdgeInsets.fromLTRB(
                                                35, 5, 0, 10),
                                            child: CustomText(
                                                text: '$drinkname',
                                                fontWeight: FontWeight.bold,
                                                fontsize: 21,
                                                hieght: 1.4,
                                                color: theColors.white),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(theIcons.star,
                                                    size: 21,
                                                    color:
                                                        theColors.deepOrange2),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ...List.generate(
                                                  controller.data.length,
                                                  (i) => CustomText(
                                                      text: controller.data[i]
                                                              ['rate']
                                                          .toString(),
                                                      fontsize: 18,
                                                      color:
                                                          theColors.deepwhite4,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                CustomText(
                                                    text: '(6.985)',
                                                    fontsize: 13,
                                                    color: theColors.deepGrey5)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      CustomContainer(
                                        margin:
                                            EdgeInsets.fromLTRB(100, 30, 0, 40),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 13),
                                              child: CustomText(
                                                color: theColors.white,

                                                text: 'Sugar',
                                                fontsize: 17,
                                                //  fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            DropdownButtonHideUnderline(child:
                                                GetBuilder<
                                                        TheProductDetailsController>(
                                                    builder: (controllerr) {
                                              return DropdownButton(
                                                  hint: CustomText(
                                                      text: '0.0',
                                                      fontsize: 17,
                                                      color: theColors.amber),
                                                  elevation: 0,
                                                  value:
                                                      controllerr.dropdownvalue,
                                                  icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: theColors
                                                          .deepOrange1),
                                                  items: controller.items.map((
                                                    String items,
                                                  ) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: CustomText(
                                                          text: items,
                                                          color:
                                                              theColors.amber),
                                                    );
                                                  }).toList(),
                                                  onChanged: (val) {
                                                    controllerr
                                                        .onChangedDropDown(val);
                                                  });
                                            })),
                                          ],
                                        ),
                                      )
                                    ])))
                          ],
                        ),
                        CustomContainer(
                          margin: EdgeInsets.fromLTRB(13, 27, 0, 5),
                          child: CustomText(
                              text: 'Description',
                              color: theColors.grey1,
                              fontsize: 18),
                        ),
                        CustomContainer(
                          margin: EdgeInsets.fromLTRB(23, 7, 15, 20),
                          child: CustomText(
                            text: '$drinkdescription',
                            fontsize: 16,
                            color: theColors.grey2,
                          ),
                        ),
                        CustomContainer(
                          margin: EdgeInsets.fromLTRB(22, 0, 0, 2),
                          child: CustomText(
                              text: 'Size',
                              color: theColors.grey1,
                              fontsize: 18),
                        ),
                        CustomContainer(
                          height: 45,
                          width: double.infinity,
                          child: GetBuilder<TheProductDetailsController>(
                              builder: (controlleer) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    fillColor: MaterialStateProperty.all(
                                        theColors.blueAccent),
                                    value: 'small',
                                    groupValue: controlleer.size,
                                    onChanged: (val) {
                                      controlleer.onChangedRadio(val);
                                      controlleer.pricefield = smalldrinkprice!;
                                    },
                                  ),
                                  SizedBox(
                                    width: 67,
                                  ),
                                  Radio(
                                      fillColor: MaterialStateProperty.all(
                                          theColors.blueAccent),
                                      value: 'medium',
                                      groupValue: controlleer.size,
                                      onChanged: (val) {
                                        controlleer.onChangedRadio(val);
                                        controlleer.pricefield =
                                            mediumdrinkprice!;
                                      }),
                                  SizedBox(
                                    width: 67,
                                  ),
                                  Radio(
                                      fillColor: MaterialStateProperty.all(
                                          theColors.blueAccent),
                                      value: 'large',
                                      groupValue: controlleer.size,
                                      onChanged: (val) {
                                        controlleer.onChangedRadio(val);
                                        controlleer.pricefield =
                                            largedrinkprice!;
                                      })
                                ]);
                          }),
                        ),
                        CustomContainer(
                          margin: EdgeInsets.only(left: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: 'S',
                                  color: theColors.deepGrey3,
                                  fontsize: 18),
                              CustomContainer(
                                margin: EdgeInsets.only(left: 102),
                                child: CustomText(
                                  text: 'M',
                                  color: theColors.deepGrey3,
                                  fontsize: 18,
                                ),
                              ),
                              CustomContainer(
                                margin: EdgeInsets.only(left: 103),
                                child: CustomText(
                                    text: 'L',
                                    color: theColors.deepGrey3,
                                    fontsize: 18),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomContainer(
                            margin: EdgeInsets.fromLTRB(26, 10, 0, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: 'price',
                                        fontsize: 17,
                                        color: theColors.deepGrey3,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      GetBuilder<TheProductDetailsController>(
                                          builder: (controlller) {
                                        return CustomContainer(
                                          margin: EdgeInsets.only(bottom: 3),
                                          child: CustomText(
                                            text:
                                                '${'\$' + controlller.pricefield}',
                                            fontWeight: FontWeight.bold,
                                            fontsize: 22,
                                            color: theColors.white,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                ),
                                CustomElevatedButton(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(70, 12, 70, 12)),
                                  onPressed: () {
                                    //if the user dosent select size of the drink
                                    if (controller.size == null) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomAlertDialog(
                                              textcolor: theColors.blue,
                                              backgroundColor:
                                                  theColors.lightblack11,
                                              text: 'please choose size',
                                            );
                                          });
                                    }
                                    //if the user dosent select the Number Of Spoon of the drink
                                    else if (controller.dropdownvalue == null) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomAlertDialog(
                                                textcolor: theColors.blue,
                                                backgroundColor:
                                                    theColors.lightblack11,
                                                text:
                                                    'please choose the number of spoons of sugar');
                                          });
                                    }
                                    //if the user selected the Number Of Spoon and the size of the drink
                                    else if (controller.size != null &&
                                        controller.dropdownvalue != null) {
                                      //show dialog to make user enter the Table Number
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomAlertDialog(
                                              textcolor: theColors.white,
                                              backgroundColor:
                                                  theColors.lightblack5,
                                              text: 'Enter your table number',
                                              content: Column(
                                                children: [
                                                  //Field to enter the table number
                                                  Card(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              94, 0, 94, 0),
                                                      child: CustomContainer(
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller: controller
                                                              .fieldcontroller,
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none),
                                                        ),
                                                      )),
                                                  // the button of the table number field
                                                  CustomElevatedButton(
                                                      onPressed: () {
                                                        //if the field is embty
                                                        if (controller
                                                                .fieldcontroller
                                                                .text ==
                                                            '') {
                                                          Get.defaultDialog(
                                                              buttonColor:
                                                                  theColors
                                                                      .black,
                                                              confirmTextColor:
                                                                  theColors
                                                                      .white,
                                                              textConfirm: 'Ok',
                                                              onConfirm: () {
                                                                Get.back();
                                                              },
                                                              title:
                                                                  'Table number ?',
                                                              titleStyle:
                                                                  TextStyle(
                                                                      fontSize:
                                                                          19),
                                                              content:
                                                                  CustomText(
                                                                text:
                                                                    'please Enter your table number',
                                                              ));
                                                        }
                                                        //if the field taken number by user
                                                        else {
                                                          //add the order to cart
                                                          controller.addOrder(
                                                              drinkname);
                                                          Get.snackbar(
                                                              'Go to your card',
                                                              'Go To Your Cart And BUY Your Drinks',
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          2),
                                                              colorText:
                                                                  theColors
                                                                      .white);
                                                          Get.offAll(() =>
                                                              btmnavbar());
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return CustomAlertDialogOfRating(
                                                                  backgroundColor:
                                                                      theColors
                                                                          .lightblack12,
                                                                  text:
                                                                      'Rate the product',
                                                                  fontsize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  textcolor:
                                                                      theColors
                                                                          .blue,
                                                                  content:
                                                                      SizedBox(
                                                                    height: 40,
                                                                    child:
                                                                        Center(
                                                                      child: RatingBar
                                                                          .builder(
                                                                        unratedColor:
                                                                            theColors.lightblack8,
                                                                        itemSize:
                                                                            30,
                                                                        initialRating:
                                                                            1.5,
                                                                        minRating:
                                                                            1,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        allowHalfRating:
                                                                            true,
                                                                        itemCount:
                                                                            5,
                                                                        itemPadding:
                                                                            EdgeInsets.symmetric(horizontal: 4.0),
                                                                        itemBuilder:
                                                                            (context, _) =>
                                                                                Icon(
                                                                          theIcons
                                                                              .star,
                                                                          color:
                                                                              theColors.amber,
                                                                        ),
                                                                        onRatingUpdate:
                                                                            (rating) {
                                                                          controller.theUserRating =
                                                                              rating;
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  okButtononPressed:
                                                                      () {
                                                                    controller.UserRate(
                                                                        userRate:
                                                                            controller
                                                                                .theUserRating,
                                                                        drinkname:
                                                                            drinkname);
                                                                    Get.back();
                                                                  },
                                                                  cancelButtononPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                );
                                                              });
                                                        }
                                                      },
                                                      child: CustomText(
                                                        text: 'Done',
                                                        fontsize: 15,
                                                        color: theColors.black,
                                                      ))
                                                ],
                                              ),
                                            );
                                          });
                                    }
                                  },
                                  child: CustomText(
                                      text: 'Add to cart',
                                      fontsize: 19,
                                      color: theColors.white),
                                ),
                                SizedBox(
                                  width: 4,
                                )
                              ],
                            ))
                      ]),
                    )));
          });
    });
  }
}
