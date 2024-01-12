
import 'package:e_voting_system/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


class bottomnavigationbar extends StatelessWidget {
  List<BottomNavigationBarItem> list_of_BottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.access_time_rounded,
      ),
      label: "Elections",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.how_to_vote), label: "Vote"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        Provider.of<provider>(context, listen: false)
            .ontap_of_bottom_navigationbar(value);
      },
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      //  backgroundColor: Colors.black,
      items: list_of_BottomNavigationBarItem,
      type: BottomNavigationBarType.fixed,
      currentIndex: Provider.of<provider>(context, listen: false)
          .selected_index_of_bottomnavigationbar,
      // selectedItemColor: Colors.black,
      elevation: 5,
    );
  }
}
