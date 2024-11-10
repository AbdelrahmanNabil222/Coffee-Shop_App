import 'package:flutter/material.dart';

class customIconButton extends StatelessWidget {
  const customIconButton(
      {super.key,
      required this.icon,
      this.onPressed,
      this.iconSize,
      this.margin,
      this.height,
      this.backgroundcolor,
      this.width,
      this.iconcolor});
  final icon;
  final void Function()? onPressed;
  final double? iconSize;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final Color? backgroundcolor;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize,
        style: ButtonStyle(
            iconColor: MaterialStateProperty.all(iconcolor),
            backgroundColor: MaterialStateProperty.all(backgroundcolor),
            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
      ),
    );
  }
}
