import 'dart:convert';

import 'package:amzon_clone/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void http_error_handle({
  required http.Response? res,
  required BuildContext? context,
  required VoidCallback onsuccess,
}) {
  switch (res!.statusCode) {
    case 200:
      onsuccess();
      break;
    case 400:
      print("aaaaa");
      showsnackbar(
          context: context,
          text: "400 code ayvo ${jsonDecode(res.body)['msg']}");
      break;
    case 500:
      showsnackbar(
          context: context,
          text: "400 code ayvo ${jsonDecode(res.body)['error_msg']}");
      break;
    default:
      showsnackbar(context: context, text: res.body.toString());
  }
}
