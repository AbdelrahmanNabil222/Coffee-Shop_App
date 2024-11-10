import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgIndicator extends StatelessWidget {
  const CustomCircularProgIndicator({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: theColors.blue,
    );
  }
}
