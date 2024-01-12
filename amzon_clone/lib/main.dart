import 'package:amzon_clone/constant/global_variable.dart';
import 'package:amzon_clone/features/auth/screens/auth_screen.dart';
import 'package:amzon_clone/features/auth/services/authservice.dart';
import 'package:amzon_clone/features/home/screens/homescreen.dart';
import 'package:amzon_clone/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider(
      create: (context) => userprovider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Authservice.getuserdata(context).then((value) {
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var token = Provider.of<userprovider>(context, listen: true).user.token;
    print(token);
    print("xx");
    return MaterialApp(
        routes: {
          "homescreen" : (context) => homescreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: globalvariable.greyBackgroundColor,
            colorScheme: ColorScheme.light(primary: Colors.orange),
            appBarTheme: AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        home: (token == null || token == "") ? authscreen() : homescreen()
        //  Scaffold(
        //   appBar: AppBar(title: Text("aa")),
        //   body: Container(
        //     child: Text("amzon clone"),
        //   ),
        // )
        );
  }
}
