import 'package:bmicalculator/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class resultpage extends StatelessWidget {
  const resultpage({
    super.key,
    required this.bmiresult,
    required this.resulttext,
    required this.advice,
  });

  final String bmiresult;
  final String resulttext;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("resultpage"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Text(
            "Your Result",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Color(0xAA4a4947),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  resulttext.toUpperCase(),
                  style: TextStyle(fontSize: 35, color: Colors.green),
                ),
                Text(
                  bmiresult,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  advice,
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10),
            height: 50,
            width: double.infinity,
            color: Colors.red,
            child: Text(
              " RE CALCULATOR",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    );
  }
}
