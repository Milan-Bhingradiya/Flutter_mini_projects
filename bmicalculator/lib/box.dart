import 'package:flutter/material.dart';

class box extends StatelessWidget {
  final Widget boxchild;
  final Color calar;
  final Function onpress;
  const box(
      {super.key,
      required this.calar,
      required this.boxchild,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Container(
        child: boxchild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: calar,
        ),
      ),
    );
  }
}
