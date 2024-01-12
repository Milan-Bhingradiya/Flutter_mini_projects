import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'locationscreen.dart';
import 'package:path/path.dart';

double latitude = 0;
double longitude = 0;

class locationanddata {
  Future<void> getlocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // print(position);

    latitude = position.latitude;
    longitude = position.longitude;

    // print("hh");

     print(latitude);
     print(longitude);
  }

  Future getdata()async{
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a7a04e126a0bfe707bbd4f487cf37eae&units=metric");

    Response response = await get(url);
    // print(response.body);

    double temp = jsonDecode(response.body)["main"]["temp"];
    var b = jsonDecode(response.body);
     return b;
   // print(temp);

    //print(b);
  }

  // locationdata obj1 = locationdata();
  // obj1.getdata(latitude, longitude);

}
