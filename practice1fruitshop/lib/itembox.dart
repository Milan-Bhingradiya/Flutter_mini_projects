import 'package:flutter/material.dart';
import 'package:practice1fruitshop/provider.dart';
import 'package:provider/provider.dart';

class box extends StatelessWidget {
  String name;
  String price;
  Color color;
  String imgpath;
  late String a;
  box(
      {required this.name,
      required this.price,
      required this.color,
      required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: color),
        // color: Colors.amber,
        child: Column(
          children: [
            Text(name),
            Expanded(child: Image.asset(imgpath)),
            GestureDetector(
                onTap: (() {
                  Provider.of<provider>(context, listen: false)
                      .totalprice(price);
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  height: 15,
                  width: 50,
                  child: Text(price),
                )),
          
          ],
        ),
      ),
    );
  }
}
