import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';

class ManagerOrderPage extends StatelessWidget {
  ManagerOrderPage({
    super.key,
  });

  final Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance
      .collection('orders')
      .orderBy('table number', descending: true)
      .orderBy('orderDate', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 163, 130, 11),
          title: CustomText(
            text: 'Orders Page',
            fontsize: 19,
            color: theColors.white,
          ),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Products Prices Page'),
                        onTap: () {
                          //   Get.to(() => ManagerPricesPage());
                        },
                      )
                    ])
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: collectionStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, i) {
                  return SizedBox(
                    height: 7,
                  );
                },
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(43, 255, 255, 255)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 120,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              width: 130,
                              child: CustomText(
                                color: theColors.white,
                                text: '${snapshot.data!.docs[i]['drink name']}',
                                fontsize: 18,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text:
                                  'Table: ${snapshot.data!.docs[i]['table number']}',
                              fontsize: 16,
                              color: Color.fromARGB(255, 219, 217, 217),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 18, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text:
                                    'Sugar: ${snapshot.data!.docs[i]['sugar']}',
                                fontsize: 16,
                                color: Color.fromARGB(255, 219, 217, 217),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                text: 'Size: ${snapshot.data!.docs[i]['size']}',
                                fontsize: 16,
                                color: Color.fromARGB(255, 219, 217, 217),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                text:
                                    'price: \$${snapshot.data!.docs[i]['price']}',
                                fontsize: 16,
                                color: Color.fromARGB(255, 219, 217, 217),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
