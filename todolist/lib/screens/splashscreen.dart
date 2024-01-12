import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todolist/screens/main.dart';
import 'package:todolist/screens/taskscreen.dart';

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
    Timer(Duration(seconds: 3), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => taskscreen()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 61, 149, 221),
      child: Center(
        child: Text(
          "TO&DO",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 80, color: Colors.white),
        ),
      ),
    );
  }
}
