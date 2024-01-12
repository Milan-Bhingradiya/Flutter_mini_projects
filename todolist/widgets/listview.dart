import 'package:flutter/material.dart';

 
class tasklist extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("aaa"),
          trailing: Checkbox(
            value: true,
            onChanged: null,
          ),
        )
      ],
    );
  }
}
