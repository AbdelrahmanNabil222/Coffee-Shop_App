import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';

class newpricespage extends StatefulWidget {
  const newpricespage(
      {super.key,
      required this.firstdocid,
      required this.subcollectionname,
      required this.seconddocid,
      required this.oldsmallsizeprice,
      required this.oldsmediumsizeprice,
      required this.oldlargesizeprice,
      required this.drinkname});
  final String firstdocid;
  final String subcollectionname;
  final String seconddocid;
  final String oldsmallsizeprice;
  final String oldsmediumsizeprice;
  final String oldlargesizeprice;
  final String drinkname;

  @override
  State<newpricespage> createState() => _newpricespageState();
}

class _newpricespageState extends State<newpricespage> {
  TextEditingController smallsizespricecontroller = TextEditingController();
  TextEditingController mediumsizespricecontroller = TextEditingController();
  TextEditingController largesizespricecontroller = TextEditingController();

  Editpricesfunction() {
    CollectionReference coffeeshop = FirebaseFirestore.instance
        .collection('coffeeshop')
        .doc(widget.firstdocid)
        .collection(widget.subcollectionname);

    return coffeeshop
        .doc(widget.seconddocid)
        .update({
          'smallsizeprice': smallsizespricecontroller.text,
          'mediumsizeprice': mediumsizespricecontroller.text,
          'largesizeprice': largesizespricecontroller.text
        })
        .then((value) => print("prices edited"))
        .catchError((error) => print("Failed to edit prices: $error"));
  }

  @override
  void initState() {
    smallsizespricecontroller.text = widget.oldsmallsizeprice;
    mediumsizespricecontroller.text = widget.oldsmediumsizeprice;
    largesizespricecontroller.text = widget.oldlargesizeprice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.amber,
        title: Text('Update prices'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Container(
                width: 140,
                child: CustomText(
                  text: widget.drinkname,
                  fontsize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 185, 8),
              child: CustomText(
                  text: 'Small Size Price',
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.bold),
            ),
            textfield(controller: smallsizespricecontroller),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 165, 8),
              child: CustomText(
                  text: 'Medium Size Price',
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.bold),
            ),
            textfield(controller: mediumsizespricecontroller),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 185, 8),
              child: CustomText(
                  text: 'Large Size Price',
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.bold),
            ),
            textfield(controller: largesizespricecontroller),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    Editpricesfunction();
                    //        Get.offAll(() => ManagerPricesPage());
                  },
                  child: CustomText(
                    color: theColors.white,
                    text: 'Update',
                    fontsize: 18,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 158, 120, 5)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(95, 14, 95, 14))),
                ))
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class textfield extends StatelessWidget {
  textfield({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(45, 0, 45, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }
}
