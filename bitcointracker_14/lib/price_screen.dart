import 'dart:ui';

import 'package:flutter/material.dart';
import 'coindata.dart';
import 'getdatafromapi.dart';

class pricescreen extends StatefulWidget {
  const pricescreen({super.key});

  @override
  State<pricescreen> createState() => _pricescreenState();
}

class _pricescreenState extends State<pricescreen> {
  String selecteddropdownvalue = "INR";
  double rateofbitcoin = 0;
  double rateofetherium = 0;
  double rateoflitecoin = 0;
  List<DropdownMenuItem<String>> dropdownitemmakeing() {
    List<DropdownMenuItem<String>> listofdropdownitems = [];
    for (int i = 0; i < 5; i++) {
      var op = DropdownMenuItem(
        child: Text(currencyname[i]),
        value: currencyname[i],
      );
      listofdropdownitems.add(op);
    }
    return listofdropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("milan"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  height: 50,
                  width: 400,
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                  child: Text(
                    "1 BTC = $rateofbitcoin",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  height: 50,
                  width: 400,
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                  child: Text(
                    "1 ETH = $rateofetherium",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  height: 50,
                  width: 400,
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                  child: Text(
                    "1 LTC = $rateoflitecoin",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
// first box no code

            Container(
              alignment: Alignment.center,
              color: Colors.green[600],
              height: 100,
              child: DropdownButton<String>(
                value: selecteddropdownvalue,
                items: dropdownitemmakeing(),
                onChanged: (value) async {
                  //important logic for change selected item in dropdowndown and show
                  setState(() {
                    selecteddropdownvalue = value.toString();
                  });
                  print(value);
                  getdata obj = getdata();
                  rateofbitcoin =
                      await obj.getdatafromapi("BTC", value.toString());
                  rateofetherium =
                      await obj.getdatafromapi("ETH", value.toString());
                  rateoflitecoin =
                      await obj.getdatafromapi("LTC", value.toString());
                },
              ),
            )
          ],
        ));
  }
}
