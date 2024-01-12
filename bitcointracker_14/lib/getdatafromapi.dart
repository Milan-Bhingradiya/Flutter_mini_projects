import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class getdata {
  Future<double> getdatafromapi(String coinname,String currencyname) async {
    var url = Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/$coinname/$currencyname?apikey=6B431D14-242A-4C1E-A136-0049751C5B0C");
    Response response = await get(url);

    double rate = jsonDecode(response.body)["rate"];
    return rate;
  }
}
