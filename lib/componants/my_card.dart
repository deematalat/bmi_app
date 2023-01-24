import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({this.child, this.color, this.onPressed, super.key});

  final Widget? child;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
        ),
        child: child,
      ),
    ));
  }
}
