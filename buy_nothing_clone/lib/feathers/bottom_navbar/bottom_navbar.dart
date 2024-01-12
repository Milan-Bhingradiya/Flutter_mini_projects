import 'package:buy_nothing_clone/feathers/community/screen/community.dart';
import 'package:buy_nothing_clone/feathers/home/screen/home.dart';
import 'package:buy_nothing_clone/feathers/inbox/screen/inbox.dart';
import 'package:buy_nothing_clone/feathers/me/screen/me.dart';
import 'package:buy_nothing_clone/feathers/share/screen/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class bottom_navbar extends StatefulWidget {
  const bottom_navbar({super.key});

  @override
  State<bottom_navbar> createState() => _bottom_navbarState();
}

class _bottom_navbarState extends State<bottom_navbar> {
  final allscreen = [
    homescreen(),
    inboxscreen(),
    sharescreen(),
    mescreen(),
    communityscreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
          print(value);
        },
        // unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: "Share",
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.grey,
                size: 35,
              )),
          BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              label: "Community",
              icon: Icon(
                Icons.design_services_rounded,
                color: Colors.grey,
              ))
        ],
      ),
      body: allscreen[index],
    );
  }
}
