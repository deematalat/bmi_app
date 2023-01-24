

import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function() onPressed;
  const MyFab({
    Key? key, required this.icon, required this.color, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor:color,
      constraints: BoxConstraints.tightFor(height:56 ,width:56 ),
      onPressed: onPressed,
      shape:CircleBorder(),
      child:Icon(icon)
      ,);
  }
}
