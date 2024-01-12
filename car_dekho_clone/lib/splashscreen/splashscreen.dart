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

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/cardekho_logo.png",
              scale: 2,
            ),
            Text(
              "Car Dekho ",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
            ),
            Text(
              "Bhadhate India Ka Bharoso",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ));
  }
}
