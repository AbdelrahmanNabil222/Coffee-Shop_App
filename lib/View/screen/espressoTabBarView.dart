import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Controller/espressoController.dart';
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

class Espressotabbarviewpage extends StatelessWidget {
  Espressotabbarviewpage({super.key});

  //final EspressoController controllerr = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UsersEspressoFavHeartColors')
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

          return GetBuilder<EspressoController>(builder: (controllerr) {
            return (controllerr.isloading == true)
                ? Center(
                    child:
                        CircularProgressIndicator(color: theColors.lightblue))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controllerr.espressodata.length,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          CustomContainer(
                            color: theColors.deepGrey2,
                            width: 167,
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            child: Column(
                              children: [
                                (controllerr.isloading == true)
                                    ? Center(
                                        child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 50),
                                        child: CustomCircularProgIndicator(),
                                      ))
                                    : Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 7, 10, 10),
                                        child: CustomNetworkImage(
                                          height: 135,
                                          width: double.infinity,
                                          image:
                                              '${controllerr.espressodata[i]['image']}',
                                        ),
                                      ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(11, 0, 35, 0),
                                  child: CustomText(
                                    color: theColors.white,
                                    text:
                                        '${controllerr.espressodata[i]['name']}',
                                    fontsize: 18,
                                    hieght: 1.2,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(22, 12, 0, 5),
                                      child: CustomText(
                                          text:
                                              '\$ ${controllerr.espressodata[i]['smallsizeprice']}',
                                          fontsize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: theColors.deepGrey3),
                                    ),
                                    CustomContainer(
                                      color: theColors.deepOrange,
                                      margin: EdgeInsets.fromLTRB(0, 9, 15, 0),
                                      height: 26.5,
                                      width: 29.5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: CustomAddTextButton(
                                        onPressed: () {
                                          Get.to(() => productdetails(
                                              drinkdescription:
                                                  controllerr.espressodata[i]
                                                      ['description'],
                                              drinkname: controllerr
                                                  .espressodata[i]['name'],
                                              largedrinkprice:
                                                  controllerr.espressodata[i]
                                                      ['largesizeprice'],
                                              mediumdrinkprice:
                                                  controllerr.espressodata[i]
                                                      ['mediumsizeprice'],
                                              smalldrinkprice:
                                                  controllerr.espressodata[i]
                                                      ['smallsizeprice'],
                                              drinkphoto: controllerr
                                                  .espressodata[i]['image']));
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
                              right: -1,
                              child: customIconButton(
                                  onPressed: () {
                                    //drink heart clicked

                                    controllerr.favbuttonClicked(
                                        drinknamee: controllerr.espressodata[i]
                                            ['name'],
                                        smallsizeprice: controllerr
                                            .espressodata[i]['smallsizeprice'],
                                        mediumsizeprice: controllerr
                                            .espressodata[i]['mediumsizeprice'],
                                        largesizeprice: controllerr
                                            .espressodata[i]['largesizeprice'],
                                        description: controllerr.espressodata[i]
                                            ['description'],
                                        image: controllerr.espressodata[i]
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
