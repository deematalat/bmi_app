import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'componants/argg.dart';
import 'componants/card_data.dart';
import 'componants/my_card.dart';
import 'componants/my_fab.dart';
import 'componants/result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int? height = 120;
  Gender? selectedGender;
 late int ? weight =60;
 late int age =18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCard(
                    child: CardData(
                      title: 'male',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInActiveColor),
                MyCard(
                    child: CardData(
                      title: 'female',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInActiveColor),
              ],
            ),
          ),
          MyCard(
            color: kInActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'height'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                  Text(height.toString(), style: kNumTextStyle),
                  Text(
                    "cm",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height:10,),
                ]
                ),SliderTheme(data:SliderThemeData(
                  activeTrackColor:Colors.white,
                  thumbColor:Color(0xfffd0255),
                  thumbShape:RoundSliderThumbShape(enabledThumbRadius:15) ,
                  overlayColor: Color(0x1ffd0255),
                  inactiveTickMarkColor: kActiveColor

                ),

                    child:  Slider(
                        max: 220,
                        min: 80,
                        value: height!.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        }),

    ),
              ],

            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCard(
                  color: kActiveColor,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'weight'.toUpperCase(),
                        style:kTitleTextStyle,
                      ),

                      Text(
                        weight.toString(),
                        style:kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(
                            color:kActiveColor ,
                            icon:FontAwesomeIcons.plus
                            ,onPressed:(){
                            setState(() {
                              weight=(weight!+1)!;
                            });
                          } ,),
                          SizedBox(width:10,),
                          MyFab(
                            color:kActiveColor ,
                            icon:FontAwesomeIcons.minus
                            ,onPressed:(){
                              setState(() {
                                weight=(weight!-1)!;
                              });
                          } ,),

                        ],
                      )
                    ],
                  )
                ),
                MyCard(

                  color: kActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'age'.toUpperCase(),
                        style:kTitleTextStyle,
                      ),

                      Text(
                         age.toString(),
                        style:kNumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyFab(
                            color:kActiveColor ,
                            icon:FontAwesomeIcons.plus
                            ,onPressed:(){
                             setState(() {
                               age++;
                            });
                          } ,),
                          SizedBox(width:10,),
                          MyFab(
                            color:kActiveColor ,
                            icon:FontAwesomeIcons.minus
                            ,onPressed:(){
                            setState(() {
                               age--;
                            });
                          } ,),

                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
           GestureDetector( onTap:(){
            Navigator.pushNamed(context,ResultScreen.route,arguments:ScreenArguments(weight!,height!) );
            },
         child: Container(
           margin: EdgeInsets.all(8),
           decoration: BoxDecoration(
             color: Colors.pink,
             borderRadius: BorderRadius.circular(7),
           ),
            padding: EdgeInsets.only(bottom: 16),
            alignment: Alignment.center,

            height: 80,
            width: double.infinity,
            child: Text(
              'CALCULATE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Colors.white),
            ),
          ),
    ),
        ],
      ),
    );
  }
}




enum Gender { male, female }
