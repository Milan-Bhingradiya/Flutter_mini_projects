import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
      theme: ThemeData.dark(),
    );
  }
}
