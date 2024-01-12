import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class screen3 extends StatelessWidget {
  const screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.cancel, color: Colors.black), onPressed: () {}),
          elevation: 0,
          backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Where would you like to drop off passenegers?",
                style: TextStyle(
                    color: Color(0xFF064856),
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Container(
                  height: 45,
                  width: 260,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/qns.png"),
                      Text("Why is an exact location better")
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 223, 222, 222),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    height: 55,
                    width: 80,
                    child: Center(child: Icon(Icons.search)),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 222, 222),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      height: 55,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Container(
                        //  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: TextField(
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: "e.g Manchester Picadilly",
                              border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 22),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: Text("map will be shown here"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
