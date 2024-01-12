// import 'package:firstapp/pages/homepage.dart';
// import 'package:firstapp/pages/loginpage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       //home: homepage(),
//       theme: ThemeData(primarySwatch: Colors.deepOrange),
//       routes: {"/": ((context) => loginpage())},
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('dice'),
      ),
      body: Dice(),
    ));
  }
}

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var a = 1;
  var b = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              setState(() {
                print("aaa");
                if (a <= 5) {
                  a++;
                } else {
                  a = 1;
                }
              });
            },
            child: Image.asset("assestimg/$a.png"),
          ),
        ),
        Expanded(
            child: TextButton(
          onPressed: () {
            setState(() {
              print("mmmm");
              if (b <= 5) {
                b++;
              } else {
                b = 1;
              }
            });
          },
          child: Image.asset("assestimg/$b.png"),
        ))
      ],
    );
  }
}
