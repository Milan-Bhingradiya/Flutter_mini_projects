import 'package:buy_nothing_clone/feathers/community/screen/community.dart';
import 'package:buy_nothing_clone/feathers/home/screen/home.dart';
import 'package:buy_nothing_clone/feathers/inbox/screen/inbox.dart';
import 'package:buy_nothing_clone/feathers/me/screen/activity.dart';
import 'package:buy_nothing_clone/feathers/me/screen/posts.dart';
import 'package:buy_nothing_clone/feathers/me/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class mescreen extends StatelessWidget {
  const mescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child:
                    Text("My Profile", style: TextStyle(color: Colors.black))),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text("Posts"),
                ),
                Tab(text: "Activity"),
                Tab(text: "Profile")
              ],
            ),
          ),
          body: TabBarView(
            children: [postsscreen(), activityscreen(), profilescreen()],
          ),
          // body: SafeArea(
          //     child: Center(
          //   child: Text("Me"),
          // )),
        ));
  }
}
