import 'dart:async';

import 'package:buy_nothing_clone/feathers/auth/screen/choose_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => choose_auth(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFe0f8d6),
      body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Column(
                   
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Image.asset("assets/splash/logo.png"),
              Text(
                "BuyNothing",
                style: TextStyle(
                    fontSize: size.width / 10, fontWeight: FontWeight.bold),
              )
                    ],
                  ),
            ],
          )),
    );
  }
}
