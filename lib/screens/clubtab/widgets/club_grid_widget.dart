import 'package:flutter/material.dart';

class ClubGridWidget extends StatefulWidget {
  const ClubGridWidget({super.key});

  @override
  State<ClubGridWidget> createState() => _ClubGridWidgetState();
}

class _ClubGridWidgetState extends State<ClubGridWidget> {
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/Event listing.png"),
          );
        },
      ),
    );
  }
}
