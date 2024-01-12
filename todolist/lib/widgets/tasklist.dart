import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/widgets/task.dart';
import 'package:todolist/widgets/tilelist.dart';

import '../providers/taskdata.dart';

class tasklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<Taskdata>(context).listoftask.length,
        itemBuilder: (context, index) {
          return tilelist(


              appear: (() {
                final task = Provider.of<Taskdata>(context, listen: false)
                    .listoftask[index];
                Provider.of<Taskdata>(context,listen: false).deletetask(task);
              }),
              // here we pass true or false that store in our list that list come from taskscreen to here.
              // ischecked:widget. listoftask[index].ischecked,  old
              ischecked:
                  Provider.of<Taskdata>(context).listoftask[index].ischecked,
              // here we pass value (text of task ) that store in our list that list come from taskscreen to here.
              //msg: widget.listoftask[index].msg,
              msg:  Provider.of<Taskdata>(context).listoftask[index].msg,

              // here is main thing start for true and false
              // here we send callback_function
              checkboxcallback: (bool? checkboxstate) {
                Provider.of<Taskdata>(context, listen: false).toggle(index);
                // setState(() {
                //  widget. listoftask[index].toggle();
                // });
              });
        });
  }
}
