import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class screen1 extends StatelessWidget {
  const screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_outlined), onPressed: () {}),
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {}),
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
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 300,
                    child: Text(
                      "Add stopovers to get  more passengers",
                      style: TextStyle(
                          color: Color(0xFF064856),
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container())
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Add city",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
