import 'package:coffee_shop/Controller/homePageOfBtmNavBarController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/manager%20pages/ManagerTableNumber.dart';
import 'package:coffee_shop/View/screen/SearchDelegate.dart';
import 'package:coffee_shop/View/screen/cappuccinoTabBarView.dart';
import 'package:coffee_shop/View/screen/cartpageofbtmnavbar.dart';
import 'package:coffee_shop/View/screen/coffeeTabBarView.dart';
import 'package:coffee_shop/View/screen/coldDrinksTabBarView.dart';
import 'package:coffee_shop/View/screen/espressoTabBarView.dart';
import 'package:coffee_shop/View/screen/favPageBrmNavBar.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customImageAsset.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class btmnavbarHome extends StatelessWidget {
  btmnavbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageOfBtmNavBarController controller = Get.find();
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          drawer: Drawer(
            backgroundColor: theColors.deepwhite,
            child: Column(children: [
              Container(
                  height: 300,
                  width: 303.8,
                  child: CustomImageAsset(
                    image: 'images/7.jpg',
                    fit: BoxFit.fill,
                  )),
              ListTile(
                onTap: () {
                  Get.back();
                },
                title: CustomText(
                  text: 'Home',
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: theColors.black,
                ),
                leading: Icon(theIcons.home),
              ),
              ListTile(
                onTap: () {
                  Get.to(() => btmnavbarCart());
                },
                title: CustomText(
                  text: 'my Cart',
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: theColors.black,
                ),
                leading: Icon(theIcons.cart),
              ),
              ListTile(
                onTap: () {
                  Get.to(BtmNavBarFavorite());
                },
                title: CustomText(
                  text: 'my Favorite',
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: theColors.black,
                ),
                leading: Icon(theIcons.heart),
              ),
              ListTile(
                onTap: () {
                  Get.off(() => ManagerTablesNumbers());
                },
                title: CustomText(
                  text: 'About Us',
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                  color: theColors.black,
                ),
                leading: Icon(theIcons.info),
              ),
              SizedBox(height: 116),
              ListTile(
                onTap: () async {
                  Get.defaultDialog(
                      textConfirm: 'Yes',
                      textCancel: 'No',
                      cancelTextColor: theColors.black,
                      backgroundColor: theColors.white,
                      buttonColor: theColors.black,
                      title: 'LogOut ?',
                      titleStyle: TextStyle(fontSize: 18, color: theColors.red),
                      onCancel: () {
                        Get.back();
                      },
                      content: Text(
                        'Do you want to LogOut ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      onConfirm: () async {
                        controller.signout();
                      });
                },
                title: CustomText(
                    text: 'LOG Out', fontsize: 15, color: theColors.deepred),
                leading:
                    Icon(theIcons.logout, size: 20, color: theColors.deepred),
              ),
            ]),
          ),
          appBar: AppBar(
            backgroundColor: theColors.black,
            iconTheme: IconThemeData(color: theColors.grey),
            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Icon(theIcons.sell_sharp, color: theColors.lightblack8),
              ),
            ],
          ),
          backgroundColor: theColors.black,
          body: SafeArea(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(28, 10, 0, 30),
                  child: CustomText(
                    color: theColors.white,
                    text: 'Find the best \ncoffee for you',
                    fontsize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: 'choose the category',
                        titleStyle: TextStyle(
                          fontSize: 21,
                        ),
                        backgroundColor: theColors.white,
                        content: SizedBox(
                          height: 200,
                          width: 200,
                          child: Center(
                            child: ListView(
                              children: [
                                CustomElevatedButton(
                                    color: theColors.deepwhite2,
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: searchdelegatee(
                                              DrinkheartColorCollectionName:
                                                  'UsersCappuccinoFavHeartColors',
                                              docname: 'cappuccino',
                                              subcollectionname:
                                                  'cappuccinodetails',
                                              type: 'cappuccino'));
                                    },
                                    child: CustomText(
                                        text: 'Capuucinno',
                                        color: theColors.black)),
                                CustomElevatedButton(
                                    color: theColors.deepwhite2,
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: searchdelegatee(
                                              DrinkheartColorCollectionName:
                                                  'UsersCoffeeFavHeartColors',
                                              docname: 'coffee',
                                              subcollectionname:
                                                  'coffeedetails',
                                              type: 'coffee'));
                                    },
                                    child: CustomText(
                                        text: 'Coffee',
                                        color: theColors.black)),
                                CustomElevatedButton(
                                    color: theColors.deepwhite2,
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: searchdelegatee(
                                              DrinkheartColorCollectionName:
                                                  'UsersEspressoFavHeartColors',
                                              docname: 'esspresso',
                                              subcollectionname:
                                                  'espressodetails',
                                              type: 'espresso'));
                                    },
                                    child: CustomText(
                                        text: 'Espresso',
                                        color: theColors.black)),
                                CustomElevatedButton(
                                    color: theColors.deepwhite2,
                                    onPressed: () {
                                      showSearch(
                                          context: context,
                                          delegate: searchdelegatee(
                                              DrinkheartColorCollectionName:
                                                  'UsersColdDrinksFavHeartColors',
                                              docname: 'colddrinks',
                                              subcollectionname:
                                                  'colddrinksdetails',
                                              type: 'colddrink'));
                                    },
                                    child: CustomText(
                                        text: 'ColdDrinks',
                                        color: theColors.black)),
                              ],
                            ),
                          ),
                        ));
                  },
                  child: Container(
                    height: 52,
                    child: Card(
                        color: theColors.lightblack1,
                        margin: EdgeInsets.symmetric(horizontal: 11),
                        child: ListTile(
                          title: CustomText(
                              text: 'find your best drink',
                              color: theColors.deepGrey6),
                          leading:
                              Icon(theIcons.search, color: theColors.deepGrey7),
                        )),
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                TabBar(
                  labelColor: theColors.deepOrange,
                  unselectedLabelStyle: TextStyle(color: theColors.deepwhite),
                  indicatorColor: theColors.deepgrey8,
                  tabs: [
                    Tab(
                      child: CustomText(
                        text: 'Cappuccino',
                        fontsize: 16.5,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'Espresso',
                        fontsize: 17,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'coffee',
                        fontsize: 18,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: 'cold drinks',
                        fontsize: 17,
                      ),
                    )
                  ],
                  isScrollable: true,
                ),
                SizedBox(
                  height: 245,
                  child: TabBarView(children: [
                    Cappuccinotabbarviewpage(),
                    Espressotabbarviewpage(),
                    Coffeetabbarviewpage(),
                    ColdDrinkstabbarviewpage(),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
