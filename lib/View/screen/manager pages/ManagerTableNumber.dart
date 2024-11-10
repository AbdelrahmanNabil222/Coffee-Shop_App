import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/View/screen/manager%20pages/ManagerOrderpage.dart';
import 'package:coffee_shop/View/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ManagerTablesNumbers extends StatelessWidget {
  ManagerTablesNumbers({super.key});
  List numbers = [
    {1: '1'},
    {1: '2'},
    {1: '3'},
    {1: '4'},
    {1: '5'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 136, 104, 8),
        title: CustomText(
          color: theColors.white,
          text: 'Tables Numbers',
          fontsize: 19,
        ),
      ),
      body: SafeArea(
          child: InkWell(
        onTap: () {
          Get.to(() => ManagerOrderPage());
        },
        child: ListView.separated(
            separatorBuilder: (context, i) {
              return SizedBox(height: 10);
            },
            itemCount: numbers.length,
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(43, 255, 255, 255)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                //height: 120,
                padding: EdgeInsets.symmetric(vertical: 40),
                width: double.infinity,
                child: Text(
                  numbers[i][1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              );
            }),
      )),
    );
  }
}
