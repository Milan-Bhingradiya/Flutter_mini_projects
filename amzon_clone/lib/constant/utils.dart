import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void showsnackbar({
  BuildContext? context,
  String? text,
}) {
  ScaffoldMessenger.of(context!)
      .showSnackBar(SnackBar(content: Text(text.toString())));

}