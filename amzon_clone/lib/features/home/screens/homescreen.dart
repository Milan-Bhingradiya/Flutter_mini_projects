import 'package:amzon_clone/features/auth/services/authservice.dart';
import 'package:amzon_clone/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<userprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 33,
              width: size.width / 1.1,
              child: TextField(
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   provider.user.email.toString(),
              //   style: TextStyle(fontSize: 40),
              // ),
              // Text(
              //   provider.user.name.toString(),
              //   style: TextStyle(fontSize: 40),
              // ),
              // Text(
              //   provider.user.address.toString(),
              //   style: TextStyle(fontSize: 40),
              // ),
              // Text(
              //   provider.user.token.toString(),
              //   style: TextStyle(fontSize: 40),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
