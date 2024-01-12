import 'package:amzon_clone/constant/utils.dart';
import 'package:amzon_clone/features/auth/services/authservice.dart';

import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  final String buttontitle;
  final VoidCallback ontap;
  const custombutton(
      {super.key, required this.buttontitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Colors.orange,
        height: 50,
        width: double.infinity,
        child: Center(
            child: Text(
          buttontitle,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        )),
      ),
    );
  }
}
