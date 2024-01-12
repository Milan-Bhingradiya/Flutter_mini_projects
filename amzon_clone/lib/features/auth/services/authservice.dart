import 'dart:convert';

import 'package:amzon_clone/constant/error_handling.dart';
import 'package:amzon_clone/constant/global_variable.dart';
import 'package:amzon_clone/constant/utils.dart';
import 'package:amzon_clone/models/auth/user_model.dart';
import 'package:amzon_clone/provider/userprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  void signup(
      {required BuildContext context,
      required name,
      required email,
      required password}) async {
    Usermodel usermodel = Usermodel(
        name: name,
        email: email,
        password: password,
        id: "",
        address: "",
        type: "");

    print("a");

    print(usermodel.toJson().toString());
    print(jsonEncode(usermodel.toJson()));
    try {
      http.Response res = await http.post(
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        Uri.parse('$url/api/signup'),
        body: jsonEncode(usermodel.toJson()),
      );

      http_error_handle(
        res: res,
        context: context,
        onsuccess: () {
          showsnackbar(context: context, text: "successfully account created");
        },
      );
    } catch (e) {
      print("catch $e");
    }
  }

  void signin({
    required BuildContext context,
    @required email,
    @required password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$url/api/signin"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode({"email": email, "password": password}));

      print(res.body);

      http_error_handle(
        res: res,
        context: context,
        onsuccess: () async {
          showsnackbar(context: context, text: "successfully login");
          SharedPreferences localdata = await SharedPreferences.getInstance();
          localdata.setString("authtoken", jsonDecode(res.body)['token']);

          Provider.of<userprovider>(context, listen: false)
              .user
              .fromJson(jsonDecode(res.body));

          print("here we print usermodel data that sav ein provider");
          print(Provider.of<userprovider>(context, listen: false).user.address);
          print(Provider.of<userprovider>(context, listen: false).user.id);

          Navigator.pushNamed(context, "homescreen");
        },
      );
    } catch (e) {
      print(e);
      showsnackbar(context: context, text: e.toString());
    }
  }

  static Future<void> getuserdata(context) async {
    print("getuserdta is callled"); 
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final authtoken = sharedPreferences.getString("authtoken");
      if (authtoken == null || authtoken == "") {
        //  return false;
        print("no local data");
      } else {
        var res = await http.post(
          Uri.parse("$url/api/authtoken_valid_or_not"),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "authtoken": authtoken
          },
        );

        var decodedres = jsonDecode(res.body);
        if (decodedres == true) {
          //get data and save in provider usermodel so we can able to show data in home page..
          var res = await http.get(
            Uri.parse("$url/api/getuserdata"),
            headers: <String, String>{
              "Content-Type": "application/json; charset=UTF-8",
              "authtoken": authtoken
            },
          );
          print(res.body);
          Provider.of<userprovider>(context, listen: false)
              .user
              .fromJson(jsonDecode(res.body));
          print(Provider.of<userprovider>(context, listen: false).user.token);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
