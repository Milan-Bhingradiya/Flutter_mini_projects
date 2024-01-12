import 'package:e_voting_system/view/after_login_default_screen/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height / 4,
              width: size.width,
              child: Image.asset("assets/e_voting_logo.png"),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              width: size.width / 1.3,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter election id",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => default_screen()));
              },
              child: Container(
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  height: size.height / 13,
                  width: size.width / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8))),
            ),
          ],
        ),
      ),
    );
  }
}
