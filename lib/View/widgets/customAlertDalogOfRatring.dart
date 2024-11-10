import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogOfRating extends StatelessWidget {
  const CustomAlertDialogOfRating(
      {super.key,
      required this.text,
      this.content,
      this.backgroundColor,
      required this.textcolor,
      required this.fontsize,
      this.fontWeight,
      this.okButtononPressed,
      this.cancelButtononPressed});
  final String? text;
  final Widget? content;
  final Color? backgroundColor;
  final Color textcolor;
  final double fontsize;
  final FontWeight? fontWeight;
  final void Function()? okButtononPressed;
  final void Function()? cancelButtononPressed;

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
      actions: [
        TextButton(
            onPressed: cancelButtononPressed,
            child: Text(
              'Rated it before',
              style: TextStyle(color: theColors.blueAccent1),
            )),
        TextButton(
            onPressed: okButtononPressed,
            child: Text(
              'DONE',
              style: TextStyle(color: theColors.blueAccent1),
            ))
      ],
    );
  }
}
