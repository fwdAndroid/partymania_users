import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/clubs.dart';
import 'package:partymania_users/screens/clubtab/following.dart';
import 'package:partymania_users/utils/colors.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({super.key});

  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: backgroundColor,
          bottom: TabBar(
            labelColor: textColor,
            unselectedLabelColor: textColor.withOpacity(.7),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(9), color: otpColor),
            tabs: [
              Tab(
                text: "Clubs",
              ),
              Tab(
                text: "Following",
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Clubs',
            style: TextStyle(color: textColor),
          ),
        ),
        body: TabBarView(
          children: [
            Clubs(),
            Following(),
          ],
        ),
      ),
    );
  }
}
