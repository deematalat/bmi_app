
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'argg.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key})
      : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
  static final route='/result';
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as  ScreenArguments ;
    double result =args.weight/ pow( args.height! / 100, 2);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(flex:2,),
              Center(
                  child: Text(
                'Your BMI is',
                style: kNumTextStyle
                  ),
              ),
              Spacer(flex:4,),
              Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kActiveColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                height:400,

                child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(

                   text:TextSpan(text: "Result ",style:kTitleTextStyle,
                       children:  <TextSpan>[
                     TextSpan( text: "${result.round()}",style:kNumTextStyle),
                         TextSpan( text: "Kg/m2",style: kTitleTextStyle),

                  ]
                  ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      (result.round() < 19)
                          ? "(under weight)"
                          : (19 <= result.round() && result.round() < 25)
                          ?
                      " (normal weight)"
                          : (25 <= result.round() && result.round() < 30)
                          ?

                      "(over weight)"
                          : (30<= result.round())
                          ? "(obese weight)"
                          : '',
                      style: kTitleTextStyle
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        (result.round() < 19)
                            ? "A BMI of below 18.5 – you're in the underweight range"
                            : (19 <= result.round() && result.round() < 25)
                            ?
                        "A BMI of between 18.5 and 24.9 – you're in the healthy weight range"
                            : (25 <= result.round() && result.round() < 30)
                            ?

                        "A BMI of between 25 and 29.9 – you're in the overweight range."
                            : (30<= result.round())
                            ? "A BMI of between 30 and 39.9 – you're in the obese range. "
                            : '',
                        style: kTitleTextStyle
                      ),
                    ),
                  ),
                ],
              ),
              ),
             SizedBox(height:17,),
          GestureDetector(
            child: Container(
            padding: EdgeInsets.only(bottom: 16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(7),
              ),
            alignment: Alignment.center,

            height: 80,
            width: double.infinity,
            child: Text(
              'REALCULATE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Colors.white),
            ),
          ),
            onTap:(){
              Navigator.of(context).pop();
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}
