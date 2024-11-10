import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.text,
      this.content,
      this.backgroundColor,
      required this.textcolor,
      this.fontsize = 15,
      this.fontWeight});
  final String? text;
  final Widget? content;
  final Color? backgroundColor;
  final Color textcolor;
  final double fontsize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: backgroundColor,
      title: Text(
        text!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontsize, color: textcolor, fontWeight: fontWeight),
      ),
      content: content,
    );
  }
}
