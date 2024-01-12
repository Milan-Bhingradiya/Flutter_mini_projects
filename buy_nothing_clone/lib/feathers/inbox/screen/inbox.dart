import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class inboxscreen extends StatelessWidget {
  const inboxscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:
            Center(child: Text("Inbox", style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
          child: Center(
        child: Text("inboxscreen"),
      )),
    );
  }
}
