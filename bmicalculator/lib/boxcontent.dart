import 'package:flutter/material.dart';
import 'box.dart';

class Boxcontent extends StatelessWidget {
  final IconData icon;
  final String label;
  const Boxcontent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
