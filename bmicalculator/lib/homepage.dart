import 'dart:ui';

import 'package:bmicalculator/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'box.dart';
import 'boxcontent.dart';
import 'brain.dart';

enum Gender { male, female }

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static const activecolor = Color.fromARGB(255, 55, 55, 90);
  static const inactivecolor = Color(0xAA4a4947);
  Color maleboxcolor = inactivecolor;
  Color femaleboxcolor = inactivecolor;
  Gender selectedgender = Gender.male;
  int height = 20;
  int weight = 20;
  int age = 20;

  // void updatecolor(Gender selectedgender) {
  //   if (selectedgender == Gender.male) {
  //     maleboxcolor = activecolor;
  //   } else {
  //     maleboxcolor = inactivecolor;
  //   }
  //   if (selectedgender == Gender.female) {
  //     femaleboxcolor = activecolor;
  //   } else {
  //     femaleboxcolor = inactivecolor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  //lrft side male
                  Expanded(
                    child: box(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.male;
                          print("mm");
                        });
                      },
                      calar: selectedgender == Gender.male
                          ? activecolor
                          : inactivecolor,
                      boxchild: Boxcontent(
                          icon: FontAwesomeIcons.mars, label: "Male"),
                    ),
                  ),

                  // right side female
                  Expanded(
                    child: box(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.female;
                          print("ff");
                        });
                      },
                      calar: selectedgender == Gender.female
                          ? activecolor
                          : inactivecolor,
                      boxchild: Boxcontent(
                          icon: FontAwesomeIcons.venus, label: "Female"),
                    ),
                  )
                ],
              )),
          //from here midddle part is startiing

          Expanded(
              flex: 3,
              child: box(
                calar: Color(0xAA4a4947),
                boxchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.red[300],
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          overlayColor: Colors.red,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newvalue) {
                            setState(() {
                              print(newvalue);
                              height = newvalue.round();
                            });
                          },
                          min: 10,
                          max: 200,
                        )),
                  ],
                ),
                onpress: () {},
              )),
          //last part is strtded///////////////////////////////////////////////////////////////////
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  //left side weight..................................................................
                  Expanded(
                      child: box(
                    calar: Color(0xAA4a4947),
                    boxchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "weight",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w800),
                        ),
                        //this row is for - and + buton on left weight button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                // left first minus
                                setState(() {
                                  weight--;
                                });
                              }),
                              child: Container(
                                child: Icon(FontAwesomeIcons.minus),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(170, 192, 176, 144),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 45,
                                width: 45,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: (() {
                                //left plus
                                setState(() {
                                  weight++;
                                });
                              }),
                              child: Container(
                                child: Icon(FontAwesomeIcons.plus),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(170, 192, 176, 144),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                height: 45,
                                width: 45,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    onpress: () {},
                  )),
                  // right side age box start from here
                  Expanded(
                    child: box(
                      calar: Color(0xAA4a4947),
                      boxchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800),
                          ),
                          // this row for - and + button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  setState(() {
                                    //minus of age
                                    age--;
                                  });
                                }),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(170, 192, 176, 144),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  setState(() {
                                    // plus age ni pase
                                    age++;
                                  });
                                }),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(170, 192, 176, 144),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      onpress: () {},
                    ),
                  )
                ],
              )),
          GestureDetector(
            onTap: (() {
              brain obj1 = brain(height: height, weight: weight);

              Navigator.push(context,

                  MaterialPageRoute(builder: (context) => resultpage(
                    bmiresult: obj1.calcbmi() ,
                    resulttext:obj1.getresult(),
                    advice: obj1.advice() ,
                  )));
            }),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 10),
              height: 50,
              width: double.infinity,
              color: Colors.red,
              child: Text(
                "CALCULATOR",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
