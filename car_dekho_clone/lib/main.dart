import 'package:car_dekho_clone/auth/login.dart';
import 'package:car_dekho_clone/home/home.dart';
import 'package:car_dekho_clone/splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {

    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  void func(){}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      initialRoute: "splashscreen",
      routes: {
        

        "splashscreen" :(context) =>  splashscreen(),
        "login":(context) => login(),

        "home":(context) => homescreen(),

      },
      
    );
  }
}
