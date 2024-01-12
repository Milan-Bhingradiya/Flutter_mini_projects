import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'dart:convert';

class getdataofcity {
  
  Future<dynamic> dataofcity(String a) async {
    String c = a;
    var url = await Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$c&appid=a7a04e126a0bfe707bbd4f487cf37eae&units=metric");

    Response response = await get(url);
    // print(response.body);

    //double temp = jsonDecode(response.body)["main"]["temp"];
    var b = jsonDecode(response.body);
    return b;
    // print(temp);

    //print(b);
  }
}
