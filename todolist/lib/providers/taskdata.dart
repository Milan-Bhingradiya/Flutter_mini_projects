import 'package:flutter/cupertino.dart';
import 'package:todolist/widgets/task.dart';

class Taskdata extends ChangeNotifier {
  int length = 0;
  List<task> listoftask = [
    task("hii Milan", false),
  ];

  int get lengthoflist {
    return length = listoftask.length;
  }

  void functionlistofdata(dynamic newtask) {
    listoftask.add(newtask);

    notifyListeners();
  }

  void toggle(var index) {
    listoftask[index].toggle();
    notifyListeners();
  }

  void deletetask(task taskobj) {
    listoftask.remove(taskobj);
    notifyListeners();
  }
}
