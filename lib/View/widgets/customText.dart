import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontsize,
      this.fontWeight,
      this.color,
      this.hieght = 1.3,
      this.textAlign});
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final double hieght;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          height: hieght,
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
