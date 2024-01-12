import 'dart:ui';

import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset(
            "assestimg/loginimage.png",
          ),
          Text("this is login"),
        ],
      ),
    );
  }
}
