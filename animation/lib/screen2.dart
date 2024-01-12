import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // (
            //   child: Container(
            //     height: 150,
            //     width: 150,
            //     color: Colors.yellow,
            //   ),
            // ),
            Container(
              height: 150,
              width: 150,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
