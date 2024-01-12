import 'package:flutter/material.dart';

class provider extends ChangeNotifier {
  int total = 0;
  int totalitems = 0;
  List shopitemlist = [
    ["apple", "100", Colors.red[300], "images/apple.png"],
    ["banana", "40", Colors.yellow[300], "images/banana.png"],
    ["orange", "200", Colors.orange[300], "images/orange.png"],
    ["graps", "90", Colors.green[300], "images/graps.png"]
  ];

  totalprice(String pricee) {
    total = total + int.parse(pricee);
    totalitems++;
    notifyListeners();
  }

  get totalbill {
    return total;
    notifyListeners();
  }

  get totalitemsfunction {
    return totalitems;
    notifyListeners();
  }
}
