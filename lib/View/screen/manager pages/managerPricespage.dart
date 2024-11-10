/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/screen/managerEditPricesPage.dart';
import 'package:coffee_shop/View/widgets/CustomNetworkImageWithContainer.dart';
import 'package:coffee_shop/View/widgets/customTextWithContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerPricesPage extends StatelessWidget {
  const ManagerPricesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            title: CustomTextWithContainer1(
              color: theColors.white,
              text: 'Products prices',
              fontsize: 20,
            ),
            bottom: TabBar(
                indicatorColor: Colors.blue,
                unselectedLabelColor: const Color.fromARGB(255, 204, 203, 203),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
                isScrollable: true,
                tabs: [
                  Tab(child: Text('Cappuccino')),
                  Tab(child: Text('Espresso')),
                  Tab(child: Text('Coffee')),
                  Tab(child: Text('Cold drinks'))
                ]),
          ),
          body: SafeArea(
              child: Center(
            child: TabBarView(children: [
              cappuccinopagee(),
              espressopagee(),
              coffeepage(),
              colddrinkdpage(),
            ]),
          ))),
    );
  }
}

// First Tabbar Page cappuccino
class cappuccinopagee extends StatelessWidget {
  cappuccinopagee({super.key});

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('coffeeshop')
      .doc('cappuccino')
      .collection('cappuccinodetails')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: CustomNetworkImageWithContainer(
                            image: '${snapshot.data!.docs[i]['image']}',
                            height: 190,
                            width: 320,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 140,
                          //color: Colors.blue,
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            snapshot.data!.docs[i]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 0.658)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'small size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'medium size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomText(
                              color: theColors.white,
                              text: 'large size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['smallsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomText(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['mediumsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomTextWithContainer1(
                                color: theColors.white,
                                text:
                                    '\$ ${snapshot.data!.docs[i]['largesizeprice']}',
                                fontsize: 19,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                        Editbutton(onpressed: () {
                          Get.to(() => newpricespage(
                                oldlargesizeprice: snapshot.data!.docs[i]
                                    ['largesizeprice'],
                                oldsmallsizeprice: snapshot.data!.docs[i]
                                    ['smallsizeprice'],
                                oldsmediumsizeprice: snapshot.data!.docs[i]
                                    ['mediumsizeprice'],
                                firstdocid: 'cappuccino',
                                subcollectionname: 'cappuccinodetails',
                                seconddocid: snapshot.data!.docs[i].id,
                                drinkname: snapshot.data!.docs[i]['name'],
                              ));
                        })
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

/////////////////////////////////////////////////////////////////////

// Second Tabbar page  espresso
class espressopagee extends StatefulWidget {
  const espressopagee({super.key});

  @override
  State<espressopagee> createState() => _espressopageeState();
}

class _espressopageeState extends State<espressopagee> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('coffeeshop')
      .doc('esspresso')
      .collection('espressodetails')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: CustomNetworkImageWithContainer(
                            image: '${snapshot.data!.docs[i]['image']}',
                            height: 190,
                            width: 320,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 140,
                          //color: Colors.blue,
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            snapshot.data!.docs[i]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 0.658)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              color: theColors.white,
                              text: 'small size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomText(
                              color: theColors.white,
                              text: 'medium size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomText(
                              color: theColors.white,
                              text: 'large size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['smallsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomText(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['mediumsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomText(
                                color: theColors.white,
                                text:
                                    '\$ ${snapshot.data!.docs[i]['largesizeprice']}',
                                fontsize: 19,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                        Editbutton(onpressed: () {
                          Get.to(() => newpricespage(
                                oldlargesizeprice: snapshot.data!.docs[i]
                                    ['largesizeprice'],
                                oldsmallsizeprice: snapshot.data!.docs[i]
                                    ['smallsizeprice'],
                                oldsmediumsizeprice: snapshot.data!.docs[i]
                                    ['mediumsizeprice'],
                                firstdocid: 'esspresso',
                                subcollectionname: 'espressodetails',
                                seconddocid: snapshot.data!.docs[i].id,
                                drinkname: snapshot.data!.docs[i]['name'],
                              ));
                        })
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
//////////////////////////////////////////////////////////////////////

// Third Tabbar page Coffee
class coffeepage extends StatefulWidget {
  const coffeepage({super.key});

  @override
  State<coffeepage> createState() => _coffeepageState();
}

class _coffeepageState extends State<coffeepage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('coffeeshop')
      .doc('coffee')
      .collection('coffeedetails')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: CustomNetworkImageWithContainer(
                            image: '${snapshot.data!.docs[i]['image']}',
                            height: 190,
                            width: 320,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 140,
                          //color: Colors.blue,
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            snapshot.data!.docs[i]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 0.658)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'small size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'medium size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'large size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['smallsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['mediumsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomTextWithContainer1(
                                color: theColors.white,
                                text:
                                    '\$ ${snapshot.data!.docs[i]['largesizeprice']}',
                                fontsize: 19,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                        Editbutton(onpressed: () {
                          Get.to(() => newpricespage(
                                oldlargesizeprice: snapshot.data!.docs[i]
                                    ['largesizeprice'],
                                oldsmallsizeprice: snapshot.data!.docs[i]
                                    ['smallsizeprice'],
                                oldsmediumsizeprice: snapshot.data!.docs[i]
                                    ['mediumsizeprice'],
                                firstdocid: 'coffee',
                                subcollectionname: 'coffeedetails',
                                seconddocid: snapshot.data!.docs[i].id,
                                drinkname: snapshot.data!.docs[i]['name'],
                              ));
                        })
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

///////////////////////////////////////////////////////////////////

//Fourth Tabbar page Cold Drinks
class colddrinkdpage extends StatefulWidget {
  const colddrinkdpage({super.key});

  @override
  State<colddrinkdpage> createState() => _colddrinkdpageState();
}

class _colddrinkdpageState extends State<colddrinkdpage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('coffeeshop')
      .doc('colddrinks')
      .collection('colddrinksdetails')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  color: Colors.black,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: CustomNetworkImageWithContainer(
                            image: '${snapshot.data!.docs[i]['image']}',
                            height: 190,
                            width: 320,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          width: 140,
                          //color: Colors.blue,
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            snapshot.data!.docs[i]['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 255, 255, 0.658)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'small size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'medium size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 15),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text: 'large size',
                              fontsize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['smallsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomTextWithContainer1(
                              color: theColors.white,
                              text:
                                  '\$ ${snapshot.data!.docs[i]['mediumsizeprice']}',
                              fontsize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 60),
                            CustomTextWithContainer1(
                                color: theColors.white,
                                text:
                                    '\$ ${snapshot.data!.docs[i]['largesizeprice']}',
                                fontsize: 19,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                        Editbutton(onpressed: () {
                          Get.to(() => newpricespage(
                                oldlargesizeprice: snapshot.data!.docs[i]
                                    ['largesizeprice'],
                                oldsmallsizeprice: snapshot.data!.docs[i]
                                    ['smallsizeprice'],
                                oldsmediumsizeprice: snapshot.data!.docs[i]
                                    ['mediumsizeprice'],
                                firstdocid: 'colddrinks',
                                subcollectionname: 'colddrinksdetails',
                                seconddocid: snapshot.data!.docs[i].id,
                                drinkname: snapshot.data!.docs[i]['name'],
                              ));
                        })
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

/////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///////////////// Widgets

// Edit buttons
class Editbutton extends StatelessWidget {
  const Editbutton({super.key, required this.onpressed});
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 18),
        child: ElevatedButton(
          onPressed: onpressed,
          child: Text(
            'Edit',
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(157, 247, 149, 3),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 10, 50, 10))),
        ));
  }
}

class Deleteproduct extends StatelessWidget {
  const Deleteproduct({super.key, required this.onpress});
  final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onpress,
        icon: Icon(
          Icons.delete,
          size: 30,
          color: Color.fromARGB(157, 247, 149, 3),
        ));
  }
}

*/