import 'package:flutter/material.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset(
      {super.key,
      required this.image,
      this.height,
      this.width,
      this.color,
      this.fit});
  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
}
