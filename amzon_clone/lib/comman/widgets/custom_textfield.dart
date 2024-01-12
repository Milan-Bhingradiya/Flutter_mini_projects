import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hindtext;
  final String? Function(String?)? validator_func;
  const customtextfield(
      {super.key, required this.controller, required this.hindtext, required this.validator_func});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator:validator_func ,
        controller: controller,
        decoration: InputDecoration(
            hintText: hindtext,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
