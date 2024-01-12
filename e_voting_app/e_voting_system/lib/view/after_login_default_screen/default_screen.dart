import 'package:e_voting_system/provider/provider.dart';
import 'package:e_voting_system/res/component/bottom_navigationbar.dart';
import 'package:e_voting_system/view/elections/elections_screen.dart';
import 'package:e_voting_system/view/loginscreen.dart';
import 'package:e_voting_system/view/profile/profilescreen.dart';
import 'package:e_voting_system/view/vote/votes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class default_screen extends StatefulWidget {
  const default_screen({super.key});

  @override
  State<default_screen> createState() => _default_screenState();
}

class _default_screenState extends State<default_screen> {
  final List<Widget> _children = [election_screen(),vote_screen(),profile_screen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[Provider.of<provider>(context, listen: true)
          .selected_index_of_bottomnavigationbar],
      bottomNavigationBar: bottomnavigationbar(),
    );
  }
}
