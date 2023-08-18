import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/widgets/upcomming_event_list.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/longtext.dart';

class ClubDetails extends StatefulWidget {
  const ClubDetails({super.key});

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
              child: Image.asset("assets/blue.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tuborg Club",
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
              child: Row(
                children: [
                  Container(
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
                        "Club",
                        style: TextStyle(color: otpColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
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
                        "Bar",
                        style: TextStyle(color: otpColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  Container(
                    width: 60,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xff3AB8FF).withOpacity(.8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style:
                            TextStyle(color: Color(0xff3AB8FF).withOpacity(.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/t.png"),
                title: Text(
                  "Ticket Price",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  "Range Rs. 480 - Rs. 1400",
                  style: TextStyle(
                      color: textColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/calls.png"),
                title: Text(
                  "+91 12345-12345",
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
                  "7/2-4, Siddhi Garden, Near Mhatre Bridge, Erandwane, Pune, Maharashtra 411004",
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
                longtext,
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
