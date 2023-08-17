import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/widgets/club_list_view_widget.dart';
import 'package:partymania_users/utils/colors.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClubListViewWidget(),
      ),
    );
  }
}
