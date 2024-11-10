import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Controller/cart%20PageController.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:coffee_shop/View/screen/modalbtmsheetofBuying.dart';
import 'package:coffee_shop/View/widgets/customContainer.dart';
import 'package:coffee_shop/View/widgets/customElevatedButton.dart';
import 'package:coffee_shop/View/widgets/customIconButton.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class btmnavbarCart extends StatelessWidget {
  btmnavbarCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartPageController controller = Get.find();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('orderDate', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CustomText(
             text: "Loading....",
              color: theColors.white, fontsize: 18,
            ));
          }

          return Scaffold(
              backgroundColor: theColors.black,
              appBar: AppBar(
                iconTheme: IconThemeData(color: theColors.grey),
                backgroundColor: theColors.black,
                title: CustomText(
                  color: theColors.white,
                  text: 'Your Cart',
                  fontsize: 20,
                ),
              ),
              body: SafeArea(
                  child: Column(
                children: [
                  SizedBox(
                    height: 525,
                    child: ListView.separated(
                        separatorBuilder: (context, i) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onLongPress: () async {
                              //when the user on long press on order
                              Get.defaultDialog(
                                  textConfirm: 'Yes',
                                  textCancel: 'No',
                                  cancelTextColor: theColors.black,
                                  backgroundColor: theColors.white,
                                  buttonColor: theColors.black,
                                  title: 'Cancel ?',
                                  titleStyle: TextStyle(
                                      fontSize: 18, color: theColors.red),
                                  onCancel: () {
                                    //close the default dialog
                                    Get.back();
                                  },
                                  content: CustomText(
                                    text: 'Do you want to Cancel the Order ?',
                                    fontWeight: FontWeight.bold,
                                    fontsize: 15,
                                  ),
                                  onConfirm: () async {
                                    //delete the order from the cart
                                    controller.deletetheorder(
                                        docid: snapshot.data!.docs[i].id);
                                  });
                            },
                            child: CustomContainer(
                              color: theColors.deepGrey2,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 120,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 127,
                                        child: CustomText(
                                          color: theColors.white,
                                          text:
                                              '${snapshot.data!.docs[i]['drink name']}',
                                          fontsize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: CustomText(
                                                text: 'Quantity : ',
                                                color: theColors.deepwhite1,
                                                fontsize: 16),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          customIconButton(
                                            backgroundcolor:
                                                theColors.deepwhite,
                                            height: 23,
                                            width: 24,
                                            iconSize: 18,
                                            onPressed: () async {
                                              //decrement the amount of order
                                              controller.decrementamount(
                                                  docid: snapshot
                                                      .data!.docs[i].id);
                                            },
                                            icon: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 9),
                                              child: Icon(theIcons.minimize),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          CustomText(
                                            text: snapshot
                                                .data!.docs[i]['amount']
                                                .toString(),
                                            color: theColors.white,
                                            fontsize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          customIconButton(
                                            height: 26,
                                            width: 27,
                                            backgroundcolor:
                                                theColors.lightblack,
                                            iconSize: 18,
                                            onPressed: () {
                                              //increment the amount of order
                                              controller.incraseAmout(
                                                  docid: snapshot
                                                      .data!.docs[i].id);
                                            },
                                            icon: Icon(
                                              theIcons.add,
                                              color: theColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  CustomContainer(
                                    margin: EdgeInsets.fromLTRB(2, 4, 18, 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                            text:
                                                'Sugar: ${snapshot.data!.docs[i]['sugar']}',
                                            fontsize: 16,
                                            color: theColors.deepwhite1),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          text:
                                              'Size: ${snapshot.data!.docs[i]['size']}',
                                          fontsize: 16,
                                          color: theColors.deepwhite1,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                            text:
                                                'price: \$${snapshot.data!.docs[i]['price']}',
                                            fontsize: 16,
                                            color: theColors.deepwhite3),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          text:
                                              'Table: ${snapshot.data!.docs[i]['table number']}',
                                          fontsize: 16,
                                          color: theColors.deepwhite1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomElevatedButton(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(100, 11, 100, 11)),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ModelbtmSheetOfBuying();
                          });
                    },
                    child: CustomText(
                      text: 'Buy now',
                      fontsize: 18,
                      color: theColors.white,
                    ),
                  )
                ],
              )));
        });
  }
}
