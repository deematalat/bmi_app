



import 'package:flutter/material.dart';
import '../constants.dart';

class  CardData extends StatelessWidget {
  final String title ;
  final IconData  icon;
  const CardData({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size:50,),
        SizedBox(height: 16,),
        Text(title.toUpperCase(),style:kTitleTextStyle
        ),
      ],
    );
  }
}
