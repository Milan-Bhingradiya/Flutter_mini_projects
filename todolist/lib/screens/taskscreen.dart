import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/taskdata.dart';
import 'package:todolist/screens/add_task.dart';
import 'package:todolist/widgets/tasklist.dart';
import 'package:todolist/widgets/task.dart';

class taskscreen extends StatefulWidget {
  const taskscreen({super.key});

  @override
  State<taskscreen> createState() => _taskscreenState();
}

class _taskscreenState extends State<taskscreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return addtask();
                Navigator.pop(context);
              },

              // here click on + icon and new scrren open that screnn we go .
              //here we send call back that set at GestureDetector ontap at that
              // screen on chnage active and send data in that function and that
              // function passed from here so this function also get values  may be we call this function call back

              // builder: (builder) => addtask((newvalue) {
              //       setState(() {
              //         listoftask.add(task(newvalue, false));
              //       });
              //       Navigator.pop(context);
              //     })
            );
          })),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.menu,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "TODo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    Provider.of<Taskdata>(context).lengthoflist.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.all(Radius.circular(20))),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),

                // here i pass my list ....
                child: tasklist(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
