import 'package:car_dekho_clone/auth/login.dart';
import 'package:car_dekho_clone/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pinput/pinput.dart';

class login_otp extends StatefulWidget {
  const login_otp({super.key});

  @override
  State<login_otp> createState() => _login_otpState();
}

class _login_otpState extends State<login_otp> {
  TextEditingController pinput_conroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Pinput(
                length: 6,
                controller: pinput_conroller,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (login.verificationid == "" ||
                      login.verificationid == null) {
                    print("xxxxxx");
                  } else {
                    print("yyyyyyy");
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: login.verificationid,
                            smsCode: pinput_conroller.text);
                    try {
                      final user = await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      if (user == null) {
                        print("wrong otp");
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    homescreen()));
                      }
                    } catch (e) {
                      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX $e");
                    }
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
