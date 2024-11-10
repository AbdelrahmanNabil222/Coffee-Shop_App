import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Controller/searchDelegateController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/btmNavBar.dart';
import 'package:coffee_shop/View/screen/noInternetPage.dart';
import 'package:coffee_shop/View/screen/the%20product%20details.dart';
import 'package:coffee_shop/View/widgets/CustomNetworkImage.dart';
import 'package:coffee_shop/View/widgets/customContainer.dart';
import 'package:coffee_shop/View/widgets/customIconButton.dart';
import 'package:coffee_shop/View/widgets/customImageAsset.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:coffee_shop/View/widgets/customTextButton.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchdelegatee extends SearchDelegate {
  searchdelegatee(
      {required this.DrinkheartColorCollectionName,
      required this.docname,
      required this.subcollectionname,
      required this.type});
  final String docname;
  final String subcollectionname;
  final String DrinkheartColorCollectionName;
  final String type;
  SearchDelegateController controller = Get.find();
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
        titleLarge: TextStyle(color: theColors.white, fontSize: 19),
      ),
      hintColor: theColors.deepwhite2,
      appBarTheme: AppBarTheme(
        foregroundColor: theColors.deepwhite2,
        color: theColors.deepGrey2,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(theIcons.delete));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(theIcons.back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var connectionresult = Connectivity().checkConnectivity();

    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return (snapshot.data == ConnectivityResult.none ||
                  connectionresult == ConnectivityResult.none)
              ? NoInternetPage(ReloadBtmOnPressed: () {
                  Get.offAll(btmnavbar());
                })
              : StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('coffeeshop')
                      .doc(docname)
                      .collection(subcollectionname)
                      .orderBy('number', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CustomText(text: "Loading"));
                    }
                    if (query.isNotEmpty) {
                      List results = snapshot.data!.docs
                          .where((element) =>
                              element["name"]
                                  .toString()
                                  .toLowerCase()
                                  .contains(query) ||
                              element["name"].toString().startsWith(query))
                          .toList();

                      return ListView(
                        children: [
                          Wrap(
                            children: [
                              ...List.generate(
                                  results.length,
                                  (i) => Stack(
                                        children: [
                                          CustomContainer(
                                            color: theColors.deepGrey2,
                                            height: 250,
                                            width: 167,
                                            margin: EdgeInsets.fromLTRB(
                                                10, 6, 0, 6),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 7, 10, 10),
                                                  child: CustomNetworkImage(
                                                    height: 135,
                                                    width: double.infinity,
                                                    image:
                                                        '${snapshot.data!.docs[i]['image']}',
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      11, 0, 40, 0),
                                                  child: CustomText(
                                                    color: theColors.white,
                                                    text:
                                                        '${results[i]['name']}',
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
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              22, 14, 0, 5),
                                                      child: CustomText(
                                                          text:
                                                              '\$ ${snapshot.data!.docs[i]['smallsizeprice']}',
                                                          fontsize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: theColors
                                                              .deepGrey3),
                                                    ),
                                                    CustomContainer(
                                                        color: theColors
                                                            .deepOrange,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0, 11, 13, 0),
                                                        height: 26.5,
                                                        width: 29.5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child:
                                                            CustomAddTextButton(
                                                          onPressed: () {
                                                            Get.to(() => productdetails(
                                                                drinkdescription: snapshot
                                                                        .data!
                                                                        .docs[i][
                                                                    'description'],
                                                                drinkphoto: snapshot
                                                                        .data!
                                                                        .docs[i]
                                                                    ['image'],
                                                                drinkname: results[i]
                                                                    ['name'],
                                                                largedrinkprice:
                                                                    snapshot.data!.docs[i][
                                                                        'largesizeprice'],
                                                                mediumdrinkprice:
                                                                    snapshot.data!.docs[i]
                                                                        ['mediumsizeprice'],
                                                                smalldrinkprice: snapshot.data!.docs[i]['smallsizeprice']));
                                                          },
                                                        ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection(
                                                      DrinkheartColorCollectionName)
                                                  .doc('colors')
                                                  .collection(FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid)
                                                  .doc('thecolors')
                                                  .collection('thecolors')
                                                  .where(
                                                    'id',
                                                    isEqualTo: FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid,
                                                  )
                                                  .orderBy('number',
                                                      descending: true)
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshott) {
                                                if (snapshott.hasError) {
                                                  return CustomText(
                                                      text:
                                                          'Something went wrong');
                                                }

                                                if (snapshott.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CustomText(
                                                      text: "Loading");
                                                }
                                                return Positioned(
                                                    bottom: 63,
                                                    right: 1,
                                                    child: customIconButton(
                                                      //the drink heart clicked
                                                      onPressed: () {
                                                        //do favbuttonClicked Function
                                                        controller.favbuttonClicked(
                                                            drinknamee: snapshot
                                                                    .data!
                                                                    .docs[i]
                                                                ['name'],
                                                            smallsizeprice: snapshot
                                                                    .data!
                                                                    .docs[i][
                                                                'smallsizeprice'],
                                                            mediumsizeprice: snapshot
                                                                    .data!
                                                                    .docs[i][
                                                                'mediumsizeprice'],
                                                            largesizeprice: snapshot
                                                                    .data!
                                                                    .docs[i]
                                                                ['largesizeprice'],
                                                            description: snapshot.data!.docs[i]['description'],
                                                            image: snapshot.data!.docs[i]['image'],
                                                            theDocClickedId: snapshott.data!.docs[i].id,
                                                            theDocHeartcolor: snapshott.data!.docs[i]['color'],
                                                            DrinkheartColorCollectionName: DrinkheartColorCollectionName,
                                                            type: type);
                                                      },
                                                      icon: CustomImageAsset(
                                                        image: theIcons.heart1,
                                                        height: 18,
                                                        width: 18,
                                                        color: Color(snapshott
                                                            .data!
                                                            .docs[i]['color']),
                                                      ),
                                                    ));
                                              }),
                                        ],
                                      ))
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  });
        });
  }
}
