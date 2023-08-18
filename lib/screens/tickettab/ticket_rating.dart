import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';

class TicketRating extends StatefulWidget {
  const TicketRating({super.key});

  @override
  State<TicketRating> createState() => _TicketRatingState();
}

class _TicketRatingState extends State<TicketRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: backgroundColor,
        title: Text(
          "Rating",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              "assets/Rectangle 34624087.png",
              width: 220,
              height: 160,
            ),
          ),
          Text(
            "Toburg Club",
            style: TextStyle(
                color: textColor, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            "7/2-4, Siddhi Garden, Near Mhatre Bridge,\nErandwane, Pune, Maharashtra",
            style: TextStyle(
                color: grey, fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 100,
              width: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: textColor, width: .6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Text(
                    "3.6 Rating",
                    style: TextStyle(
                        color: grey, fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          Spacer(),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: AlignmentDirectional.bottomCenter,
              child: SaveButton(title: "Done", onTap: () {}))
        ],
      ),
    );
  }
}
