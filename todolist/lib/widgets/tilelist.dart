import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/Taskdata.dart';

class tilelist extends StatelessWidget {
  late final bool ischecked;
  late final String msg;
  late final void Function(bool? v) checkboxcallback;
  late final void Function() appear;

  tilelist({
    required this.ischecked,
    required this.msg,
    required this.checkboxcallback,
    required this.appear,
  });

  // void checkboxchange(bool? checkboxstate) {
  //   // setState(() {
  //   //   ischecked = checkboxstate!;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: appear,
      child: ListTile(
        title: Text(
          msg,
          style: TextStyle(
              decoration: ischecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            value: ischecked,
            //onChanged: null,
            onChanged: checkboxcallback
            // here another way
            //onchnage:(value)
            //{
            // checkboxcallback(value)
            //}
            ),
      ),
    );
  }
}
