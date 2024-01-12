import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice1fruitshop/shopingpage.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Image.asset("images/logo.png"),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            "Deliver Every Fruit to Your Doorstep",
            style: TextStyle(
              fontSize: 40,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return shopingpage();
            })));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              alignment: Alignment.center,
              height: 50, 
              width: 200,
              child: Text(
                "Lets start",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              )),
        )
      ],
    ));
  }
}
