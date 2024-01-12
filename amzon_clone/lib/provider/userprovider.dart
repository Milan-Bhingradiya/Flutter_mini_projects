import 'package:amzon_clone/models/auth/user_model.dart';
import 'package:flutter/cupertino.dart';

class userprovider extends ChangeNotifier {
  Usermodel user = Usermodel();
  final a = null;

  void setuser(Usermodel x) {
    user = x;
  }
}
