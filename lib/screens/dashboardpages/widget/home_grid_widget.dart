import 'package:flutter/material.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_details.dart';

class HomeGridWidget extends StatefulWidget {
  const HomeGridWidget({super.key});

  @override
  State<HomeGridWidget> createState() => _HomeGridWidgetState();
}

class _HomeGridWidgetState extends State<HomeGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Set the number of items per row
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => HomeDetails()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/Event listing.png"),
            ),
          );
        },
      ),
    );
  }
}
