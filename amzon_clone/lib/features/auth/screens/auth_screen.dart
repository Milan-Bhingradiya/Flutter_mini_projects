import 'package:amzon_clone/comman/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:amzon_clone/comman/widgets/custom_textfield.dart';
import 'package:amzon_clone/comman/widgets/custom_button.dart';
import 'package:amzon_clone/constant/global_variable.dart';

import '../services/authservice.dart';

enum loginorsignup { login, signup }

class authscreen extends StatefulWidget {
  const authscreen({super.key});

  @override
  State<authscreen> createState() => _authscreenState();
}

class _authscreenState extends State<authscreen> {
  final signinformkey = GlobalKey<FormState>();
  final signupformkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();

  loginorsignup loginsignupobj = loginorsignup.login;
  String group = "anything";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text("Welcome"),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListTile(
                      tileColor: loginsignupobj == loginorsignup.login
                          ? Colors.white
                          : globalvariable.greyBackgroundColor,
                      title: Text("Login"),
                      leading: Radio(
                          value: loginorsignup.login,
                          groupValue: loginsignupobj,
                          onChanged: (value) {
                            setState(() {
                              loginsignupobj = value!;
                              print(group);
                            });
                          }),
                    ),
                    if (loginsignupobj == loginorsignup.login)
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Form(
                            key: signinformkey,
                            child: Column(
                              children: [
                                customtextfield(
                                  controller: emailcontroller,
                                  hindtext: "Email",
                                  validator_func: (value) {
                                    if (value!.isEmpty) {
                                      return "enter some values";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                customtextfield(
                                  controller: passwordcontoller,
                                  hindtext: "Password",
                                  validator_func: (value) {
                                    if (value!.isEmpty) {
                                      return "enter some values";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                custombutton(
                                  buttontitle: "signin",
                                  ontap: () {
                                     if (signinformkey.currentState!
                                        .validate()) {
                                      Authservice obj = Authservice();
                                      obj.signin(
                                          context: context,
                                          email: emailcontroller.text,
                                          password: passwordcontoller.text);
                                    }
                                    
                                    print("sign in touch ");
                                  },
                                )
                              ],
                            )),
                      ),
                    ListTile(
                      tileColor: loginsignupobj == loginorsignup.signup
                          ? globalvariable.backgroundColor
                          : globalvariable.greyBackgroundColor,
                      title: Text("sign up"),
                      leading: Radio(
                          value: loginorsignup.signup,
                          groupValue: loginsignupobj,
                          onChanged: ((value) {
                            setState(() {});
                            loginsignupobj = value!;
                            print(group);
                          })),
                    ),
                    if (loginsignupobj == loginorsignup.signup)
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Form(
                            key: signupformkey,
                            child: Column(
                              children: [
                                customtextfield(
                                  controller: namecontroller,
                                  hindtext: "Name",
                                  validator_func: (value) {
                                    if (value!.isEmpty) {
                                      return "enter some values";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                customtextfield(
                                  controller: emailcontroller,
                                  hindtext: "Email",
                                  validator_func: (value) {
                                    if (value!.isEmpty) {
                                      return "enter some values";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                customtextfield(
                                  controller: passwordcontoller,
                                  hindtext: "Password",
                                  validator_func: (value) {
                                    if (value!.isEmpty) {
                                      return "enter some values";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                custombutton(
                                  buttontitle: "signup",
                                  ontap: () {
                                    print("signup touch");
                                    if (signupformkey.currentState!
                                        .validate()) {
                                      Authservice obj = Authservice();
                                      obj.signup(
                                          context: context,
                                          name: namecontroller.text,
                                          email: emailcontroller.text,
                                          password: passwordcontoller.text);
                                    }
                                  },
                                ),
                              ],
                            )),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
