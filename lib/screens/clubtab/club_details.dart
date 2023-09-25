import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/widgets/upcomming_event_list.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/longtext.dart';

class ClubDetails extends StatefulWidget {
  final uid;
  final clubCity;
  final clubCountry;
  final clubDescription;
  final clubLocation;
  final clubName;
  final clubType;
  final clubState;
  final coverPhoto;
  final followers;
  final clubPhoneNumber;

  const ClubDetails({
    super.key,
    required this.clubCity,
    required this.clubCountry,
    required this.clubDescription,
    required this.clubLocation,
    required this.clubName,
    required this.clubState,
    required this.clubType,
    required this.clubPhoneNumber,
    required this.coverPhoto,
    required this.followers,
    required this.uid,
  });

  @override
  State<ClubDetails> createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.coverPhoto,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.clubName.toString(),
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  Image.asset(
                    "assets/dots.png",
                    height: 20,
                    width: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: otpColor.withOpacity(.8),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.clubType,
                    style: TextStyle(color: otpColor.withOpacity(.6)),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     leading: Image.asset("assets/t.png"),
            //     title: Text(
            //       "Ticket Price",
            //       style: TextStyle(
            //           color: textColor,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 18),
            //     ),
            //     subtitle: Text(
            //       "Range Rs. 480 - Rs. 1400",
            //       style: TextStyle(
            //           color: textColor.withOpacity(.7),
            //           fontWeight: FontWeight.w400,
            //           fontSize: 14),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/calls.png"),
                title: Text(
                  widget.clubPhoneNumber,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  "Call Now",
                  style: TextStyle(
                      color: otpColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/Group 14428.png"),
                title: Text(
                  widget.clubLocation,
                  style: TextStyle(
                      color: textColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Amenities",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff4E4E4E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xff4E4E4E),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Pool",
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff4E4E4E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xff4E4E4E),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Snooker",
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff4E4E4E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xff4E4E4E),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "In House Drinks",
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "About Event",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.clubDescription,
                style: TextStyle(
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            UpComingEventsList(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
