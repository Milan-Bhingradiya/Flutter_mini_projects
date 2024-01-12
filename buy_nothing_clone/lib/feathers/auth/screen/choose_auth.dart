import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class choose_auth extends StatefulWidget {
  const choose_auth({super.key});

  @override
  State<choose_auth> createState() => _choose_authState();
}

class _choose_authState extends State<choose_auth> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: size.height / 7,
                  decoration: BoxDecoration(color: Color(0xFFf0f8ed)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/splash/logo.png",
                        height: size.height / 11,
                        width: size.width / 6,
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      Text(
                        "BuyNothing",
                        style: TextStyle(
                            fontSize: size.width / 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(size.width / 15),
                  child: Text(
                    "We believe buying less and sharing more makes us all richer and the planet cleaneri join us!",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(fontSize: size.width / 16)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(size.width / 25),
                  height: size.height / 16,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF3679ea),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset("assets/facebook_logo.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text(
                          "Continue with facebook",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(size.width / 25),
                  height: size.height / 16,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF3679ea),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(2),
                          child: Image.asset("assets/google_logo.png")),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Sign in with Google",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("or"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "bottom_navbar");
                  },
                  child: Container(
                    margin: EdgeInsets.all(size.width / 25),
                    height: size.height / 14,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFF5adb1f),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Sign up with email",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    GestureDetector(
                      child: Text(
                        "--Log in",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(5),
              child: RichText(
                text: TextSpan(
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 14)),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "By continuing, you confirm you are at least 18 years of age and agree to BuyNothing's "),
                      TextSpan(
                          text: "Privacy Policy ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "and "),
                      TextSpan(
                          text: "Terms Of Use",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
              )),
        ],
      )),
    ));
  }
}
