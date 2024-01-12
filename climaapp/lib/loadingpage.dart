import 'package:climaapp/location.dart';
import 'package:climaapp/locationscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'location.dart';

double lat = 0;
double lon = 0;

class loadingpage extends StatefulWidget {
  const loadingpage({super.key});

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {


var weatherdata;
  @override
  // ignore: must_call_super
  void initState()  {
    super.initState();
    // ignore: avoid_print
    print("initState Called");
   method1();
  }


  void method1() async
  {
    locationanddata obj1 = locationanddata();
    await obj1.getlocation();
    weatherdata=  await obj1.getdata();
    Future(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(sendedlocation: weatherdata,);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body:Column(children: [
          SizedBox(height: 250
            ,),
          Container(child: Text("Wait your loaction is fething " ,  style: TextStyle(

            fontSize: 20.0,
          ),),),
          Container( child: Center(child: SpinKitFadingCircle(
            color: Colors.black,
            size: 60.0,
          )),)
        ],)
      ),
    );
  }
}
