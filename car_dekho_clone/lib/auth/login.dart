import 'package:car_dekho_clone/auth/login_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class login extends StatefulWidget {
  const login({super.key});
  static String verificationid = "";

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController mobilenum_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login or Register",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "for Better Experience Order tracking & regular updates",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf1f4f9),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: mobilenum_controller,
                      decoration: InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(color: Colors.red),
                          border: InputBorder.none),
                    ),
                  )),

              /////////////////////////////
              SizedBox(
                height: 20,
              ),
              /////////////////////////////
              GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, "home");
                  try {
                    if (mobilenum_controller.text.length == 10) {
                      print("sended");
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${mobilenum_controller.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          login.verificationid = verificationId;
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }
                  } catch (e) {
                    print(" ggggggggggggggggggg  $e");
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => login_otp(),
                  //     ));
                },
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Color(0xFFa3a3a3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Send otp",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
