import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Controller/cappuccinoController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/the%20product%20details.dart';
import 'package:coffee_shop/View/widgets/CustomImageAsset.dart';
import 'package:coffee_shop/View/widgets/CustomNetworkImage.dart';
import 'package:coffee_shop/View/widgets/customCircularProgIndicator.dart';
import 'package:coffee_shop/View/widgets/customContainer.dart';
import 'package:coffee_shop/View/widgets/customIconButton.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:coffee_shop/View/widgets/customTextButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cappuccinotabbarviewpage extends StatelessWidget {
  Cappuccinotabbarviewpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // CuppuccinoController controller = Get.find();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UsersCappuccinoFavHeartColors')
            .doc('colors')
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .doc('thecolors')
            .collection('thecolors')
            .where(
              'id',
              isEqualTo: FirebaseAuth.instance.currentUser!.uid,
            )
            .orderBy('number', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return GetBuilder<CuppuccinoController>(builder: (controllerr) {
            return (controllerr.isloading == true)
                ? Center(
                    child:
                        CircularProgressIndicator(color: theColors.lightblue),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controllerr.cappuccinodata.length,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          CustomContainer(
                            color: theColors.deepGrey2,
                            width: 167,
                            borderRadius: BorderRadius.circular(20),
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              children: [
                                (controllerr.isloading == true)
                                    ? Center(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 50),
                                          child: CustomCircularProgIndicator(),
                                        ),
                                      )
                                    : Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 10, 10),
                                        child: CustomNetworkImage(
                                          height: 135,
                                          width: double.infinity,
                                          image:
                                              '${controllerr.cappuccinodata[i]['image']}',
                                        ),
                                      ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(11, 0, 31, 0),
                                  child: CustomText(
                                    text:
                                        '${controllerr.cappuccinodata[i]['name']}',
                                    fontsize: 18,
                                    hieght: 1.1,
                                    color: theColors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(22, 14, 0, 5),
                                      child: CustomText(
                                          text:
                                              '\$ ${controllerr.cappuccinodata[i]['smallsizeprice']}',
                                          fontsize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: theColors.deepGrey3),
                                    ),
                                    CustomContainer(
                                        color: theColors.deepOrange,
                                        margin:
                                            EdgeInsets.fromLTRB(0, 11, 13, 0),
                                        height: 26.5,
                                        width: 29.5,
                                        borderRadius: BorderRadius.circular(10),
                                        child: CustomAddTextButton(
                                          onPressed: () {
                                            Get.to(() => productdetails(
                                                drinkdescription:
                                                    controllerr.cappuccinodata[i]
                                                        ['description'],
                                                drinkphoto: controllerr
                                                    .cappuccinodata[i]['image'],
                                                drinkname: controllerr
                                                    .cappuccinodata[i]['name'],
                                                largedrinkprice:
                                                    controllerr.cappuccinodata[i]
                                                        ['largesizeprice'],
                                                mediumdrinkprice:
                                                    controllerr.cappuccinodata[i]
                                                        ['mediumsizeprice'],
                                                smalldrinkprice:
                                                    controllerr.cappuccinodata[i]
                                                        ['smallsizeprice']));
                                          },
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 53,
                              right: -1,
                              child: customIconButton(
                                  onPressed: () {
                                    //drink heart clicked
                                    controllerr.favbuttonClicked(
                                        drinknamee: controllerr
                                            .cappuccinodata[i]['name'],
                                        smallsizeprice:
                                            controllerr.cappuccinodata[i]
                                                ['smallsizeprice'],
                                        mediumsizeprice:
                                            controllerr.cappuccinodata[i]
                                                ['mediumsizeprice'],
                                        largesizeprice:
                                            controllerr.cappuccinodata[i]
                                                ['largesizeprice'],
                                        description: controllerr
                                            .cappuccinodata[i]['description'],
                                        image: controllerr.cappuccinodata[i]
                                            ['image'],
                                        theDocClickedId:
                                            snapshot.data!.docs[i].id,
                                        theDocHeartcolor: snapshot.data!.docs[i]
                                            ['color']);
                                  },
                                  icon: CustomImageAsset(
                                    image: theIcons.heart1,
                                    height: 20,
                                    width: 20,
                                    color:
                                        Color(snapshot.data!.docs[i]['color']),
                                  ))),
                        ],
                      );
                    });
          });
        });
  }
}
