import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/ticket_tab.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/longtext.dart';

class HomeDetails extends StatefulWidget {
  final uuid;
  final coupleValue;
  final eventAmenities;
  final eventCoverPhoto;
  final eventDate;
  final eventDescription;
  final eventLocation;
  final eventName;
  final eventPhoto;
  final eventType;
  final fromTime;
  final nameOffer;
  final tickets;
  final table;
  final timeDeadlineTicket;
  final eventPrice;
  HomeDetails(
      {super.key,
      required this.eventAmenities,
      required this.coupleValue,
      required this.eventCoverPhoto,
      required this.eventDate,
      required this.eventDescription,
      required this.eventLocation,
      required this.eventName,
      required this.eventPhoto,
      required this.eventType,
      required this.fromTime,
      required this.nameOffer,
      required this.table,
      required this.tickets,
      required this.timeDeadlineTicket,
      required this.eventPrice,
      required this.uuid});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
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
              child: Text(
                "Holi Celebration",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Playboy Club",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
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
                        color: textColor.withOpacity(.8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Music",
                        style: TextStyle(color: textColor.withOpacity(.6)),
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
                        color: textColor.withOpacity(.8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Night",
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  )
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
                leading: Image.asset("assets/Group 14427.png"),
                title: Text(
                  "20% OFF",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  "Use Code: HAPPYFRIDAY",
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
                leading: Image.asset("assets/s.png"),
                title: Text(
                  "March 16, 2023",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  "Thursday, 09:00 PM - 02:00 AM",
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
                "Availability and Deadline",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ticket Available",
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "95",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Purchase Deadline",
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "20-03-2023",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Location",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/map.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Clubs",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 335,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: textColor, width: .3)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/Rectangle 34624088.png",
                        height: 60,
                        width: 100,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tuborg Club",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: otpColor),
                                      borderRadius: BorderRadius.circular(15),
                                      color: otpColor.withOpacity(.5)),
                                  child: Center(
                                    child: Text(
                                      "Club",
                                      style: TextStyle(
                                          color: otpColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: otpColor),
                                      borderRadius: BorderRadius.circular(15),
                                      color: otpColor.withOpacity(.5)),
                                  child: Center(
                                    child: Text(
                                      "Bar",
                                      style: TextStyle(
                                          color: otpColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: textColor,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "Invite Your Friends",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "Get 150 Rupees When your friend\nactivates their account",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Group 14436.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Twitter.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Instagram.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            "assets/LinkedIn.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/WhatsApp.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Facebook.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/dot.png",
                          height: 48,
                          width: 48,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 270,
                        child: SaveButton(
                            title: "Rs. 1150 Book Now",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => TicketTab()));
                            }),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
