import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black), onPressed: () {}),
          elevation: 0,
          backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Image.asset(
              "assets/carandman_logo.png",
              scale: 0.8,
            )),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Enter a specific place so we can recommend your ride to people nearby",
                    style: TextStyle(
                        color: Color(0xFF064856),
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(flex: 1, child: Container())
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Center(
              child: Container(
                height: 45,
                width: 85,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: Center(
                    child: Text(
                  "Got it",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
