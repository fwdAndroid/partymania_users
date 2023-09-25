import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/widgets/club_grid_widget.dart';
import 'package:partymania_users/utils/colors.dart';

class ClubSeeAll extends StatefulWidget {
  const ClubSeeAll({super.key});

  @override
  State<ClubSeeAll> createState() => _ClubSeeAllState();
}

class _ClubSeeAllState extends State<ClubSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "All Club List",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: ClubGridWidget(),
    );
  }
}
