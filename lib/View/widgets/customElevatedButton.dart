import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.onPressed,
      this.child,
      this.padding,
      this.color = const Color.fromARGB(157, 247, 149, 3)});
  final void Function()? onPressed;
  final Widget? child;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
          backgroundColor: MaterialStateProperty.all(color),
          padding: padding),
    );
  }
}
