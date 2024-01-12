import 'package:climaapp/locationscreen.dart';
import 'package:flutter/material.dart';

import 'loadingpage.dart';

void main() {
  runApp(milan());
}

class milan extends StatelessWidget {
  const milan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: loadingpage(),
      home: loadingpage(),
    );
  }
}
