import 'package:flutter/material.dart';
import 'package:practice1fruitshop/provider.dart';
import 'package:provider/provider.dart';
import 'itembox.dart';

class shopingpage extends StatefulWidget {
  const shopingpage({super.key});

  @override
  State<shopingpage> createState() => _shopingpageState();
}

class _shopingpageState extends State<shopingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: null, child: Icon(Icons.shopping_bag)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "GOOD MORNING",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Lets order for fresh fruit for you",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: Provider.of<provider>(context).shopitemlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return box(
                      name: Provider.of<provider>(context).shopitemlist[index]
                          [0],
                      price: Provider.of<provider>(context).shopitemlist[index]
                          [1],
                      color: Provider.of<provider>(context).shopitemlist[index]
                          [2],
                      imgpath:
                          Provider.of<provider>(context).shopitemlist[index][3],
                    );
                  })),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 120,
                    color: Colors.green[300],
                    child: Text(
                      "total bill :${Provider.of<provider>(context).totalbill} ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    color: Colors.green[300],
                    child: Text(
                      "total item :${Provider.of<provider>(context).totalitemsfunction} ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
