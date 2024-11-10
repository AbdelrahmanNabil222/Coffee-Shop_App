import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.margin,
      this.width,
      this.child,
      this.height,
      this.color,
      this.borderRadius});
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: child);
  }
}
