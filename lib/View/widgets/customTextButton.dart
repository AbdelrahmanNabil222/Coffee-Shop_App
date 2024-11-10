import 'package:coffee_shop/Core/constant/colors.dart';
import 'package:coffee_shop/Core/constant/icons.dart';
import 'package:flutter/material.dart';

class CustomAddTextButton extends StatelessWidget {
  const CustomAddTextButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style:
            ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.all(0))),
        child: Icon(theIcons.add, color: theColors.white));
  }
}
