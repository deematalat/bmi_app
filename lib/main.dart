import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'componants/result.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme().copyWith(button: TextStyle(fontSize: 24)),
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        sliderTheme:sliderThemeData(),
      ),
      routes:{
        '/':(context)=>MyHomePage(),
        ResultScreen.route:(context)=>ResultScreen(),
      },

    );
  }
}

SliderThemeData sliderThemeData(){
  return SliderThemeData(
    trackHeight:2,
    overlayColor:Color(0x1ff0d225),
    thumbShape: RoundSliderThumbShape(
      enabledThumbRadius: 15.0,
    ),
    thumbColor: Color(0xffff0d225),
  );
}