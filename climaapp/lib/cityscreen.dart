import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'logicofcity.dart';

class cityscreen extends StatefulWidget {
  const cityscreen({super.key});

  @override
  State<cityscreen> createState() => _cityscreenState();
}

class _cityscreenState extends State<cityscreen> {
    bool mybool = false;
  String cityname = "";
  double citytemprature = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text("ENTER CITY"),
          ),
          body: Column(
            children: [
              Container(
margin: EdgeInsets.fromLTRB(100, 100, 100, 0),
                width: 700,
                child: TextField(

                  onChanged: (value) {
                    print(value);
                    cityname = value.toString();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter city',
                  ),
                ),
              ),

              SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                ),

                width: 200,
                height: 70,
                child: GestureDetector(
                  onTap: () async {
                    // getdataofcity obj = getdataofcity();
                    // citytemprature = await obj.dataofcity(cityname);
                    // print(citytemprature);
                    // mybool=true;
                    Navigator.pop(context,cityname);
                  },

                  child: Container(
                    margin: EdgeInsets.fromLTRB(40,20, 0,0),
                    child: Text("SUBMIT ",style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),) ,
                  ),
                ),
              ),


              Visibility(
                visible : mybool,
                child: Text(citytemprature.toString()),
              )

              // Container(child: ,)
              //   Text(citytemprature.toString())
            ],
          )),
    );
  }
}
