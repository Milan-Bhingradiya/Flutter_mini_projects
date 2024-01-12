import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/taskdata.dart';
import 'package:todolist/widgets/task.dart';

class addtask extends StatelessWidget {
  late String newenteredtask;
  //Function callbackfromtaskscreen;

  // addtask(this.callbackfromtaskscreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Consumer<Taskdata>(
          builder: (context, Provider, child) {
            return Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Add Task",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue),
                ),
                TextField(
                  onChanged: ((value) {
                    newenteredtask = value;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                     task obj = task(newenteredtask, false);
                    Provider.functionlistofdata(obj);
                   // Provider.listoftask.add(task(newenteredtask, false));

                    //callbackfromtaskscreen(newenteredtask);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        "ADD",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
