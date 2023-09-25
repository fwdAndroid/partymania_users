import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/longtext.dart';

class BookingDetails extends StatefulWidget {
  final uuid;
  final artistType;
  final bird;
  final dayNight;
  final eventAmenities;
  final eventCoverPhoto;
  final eventDescription;
  final eventLocation;
  final eventName;
  final eventPhoto;
  final eventStartDate;
  final eventTicketPrice;
  final eventTicketSession;
  final eventTicketTimeBefore;
  final eventTotalTickets;
  final eventType;
  final fromEventDate;
  final numofPeople;
  final offerCode;
  final offerName;
  final participantType;
  final tableNumber;
  final tablePrice;
  final tableType;
  final ticketPurchase;
  final timeDeadlineTicket;
  final toEventDate;
  final totaltables;
  final clubuid;
  const BookingDetails(
      {super.key,
      required this.artistType,
      required this.bird,
      required this.clubuid,
      required this.dayNight,
      required this.eventAmenities,
      required this.eventCoverPhoto,
      required this.eventDescription,
      required this.eventLocation,
      required this.eventName,
      required this.eventPhoto,
      required this.eventStartDate,
      required this.eventTicketPrice,
      required this.eventTicketSession,
      required this.eventTicketTimeBefore,
      required this.eventTotalTickets,
      required this.eventType,
      required this.fromEventDate,
      required this.numofPeople,
      required this.offerCode,
      required this.offerName,
      required this.participantType,
      required this.tableNumber,
      required this.tablePrice,
      required this.tableType,
      required this.ticketPurchase,
      required this.timeDeadlineTicket,
      required this.toEventDate,
      required this.totaltables,
      required this.uuid});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.uuid);
  }

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
                widget.eventCoverPhoto.toString(),
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.eventName,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Playboy Club",
            //     style: TextStyle(
            //         color: textColor,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 12),
            //   ),
            // ),
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
                        widget.eventType,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/Group 14427.png"),
                title: Text(
                  "Applied Coupon",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  widget.offerCode,
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
                  widget.eventStartDate,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  widget.eventStartDate,
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
                  widget.eventLocation,
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
                        widget.eventAmenities,
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
                widget.eventDescription,
                style: TextStyle(
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Terms and Conditions",
            //     style: TextStyle(
            //         color: textColor,
            //         fontWeight: FontWeight.w500,
            //         fontSize: 20),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset("assets/to.png"),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset("assets/to.png"),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset("assets/to.png"),
            // ),
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
                      Spacer(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "My Purchase",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            // SizedBox(
            //   height: 300,
            //   child: StreamBuilder<QuerySnapshot>(
            //       stream: FirebaseFirestore.instance
            //           .collection("bookings")
            //           .where("eventuid", isEqualTo: widget.uuid)
            //           .snapshots(),
            //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //         if (snapshot.hasError) {
            //           return Text('Something went wrong');
            //         }

            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return Text("Loading");
            //         }
            //         return SizedBox(
            //           height: 200,
            //           child: ListView(
            //               shrinkWrap: true,
            //               children: snapshot.data!.docs
            //                   .map((DocumentSnapshot document) {
            //                 Map<String, dynamic> data =
            //                     document.data()! as Map<String, dynamic>;
            //                 print(data['bookinguuid']);
            //                 return ListTile(
            //                   title: Text(
            //                     data['bookinguuid'],
            //                     style: TextStyle(color: Colors.white),
            //                   ),
            //                   subtitle: Text(data['bookinguuid']),
            //                 );
            //               }).toList()),
            //         );
            //         // return Padding(
            //         //   padding: const EdgeInsets.all(8.0),
            //         //   child: Row(
            //         //     mainAxisAlignment: MainAxisAlignment.center,
            //         //     children: [
            //         //       Container(
            //         //         width: 136,
            //         //         height: 140,
            //         //         decoration: BoxDecoration(
            //         //             borderRadius: BorderRadius.circular(10),
            //         //             border:
            //         //                 Border.all(color: textColor, width: .5)),
            //         //         child: Column(
            //         //           mainAxisAlignment: MainAxisAlignment.start,
            //         //           children: [
            //         //             Padding(
            //         //               padding: const EdgeInsets.all(8.0),
            //         //               child: Text(
            //         //                 snap['bookinguuid'],
            //         //                 style: TextStyle(
            //         //                     color: textColor,
            //         //                     fontSize: 10,
            //         //                     fontWeight: FontWeight.w400),
            //         //               ),
            //         //             ),
            //         //             Padding(
            //         //               padding: const EdgeInsets.all(8.0),
            //         //               child: Text(
            //         //                 "Full Cover",
            //         //                 style: TextStyle(
            //         //                     color: textColor.withOpacity(.6)),
            //         //               ),
            //         //             ),
            //         //             Align(
            //         //               alignment: Alignment.centerLeft,
            //         //               child: Container(
            //         //                 margin: EdgeInsets.only(left: 12),
            //         //                 child: Text(
            //         //                   "After 9:30 PM",
            //         //                   style: TextStyle(
            //         //                       color: textColor,
            //         //                       fontWeight: FontWeight.w400,
            //         //                       fontSize: 10),
            //         //                   textAlign: TextAlign.start,
            //         //                 ),
            //         //               ),
            //         //             ),
            //         //             Padding(
            //         //               padding: const EdgeInsets.all(8.0),
            //         //               child: Divider(
            //         //                 color: textColor,
            //         //               ),
            //         //             ),
            //         //             Align(
            //         //               alignment: Alignment.centerLeft,
            //         //               child: Container(
            //         //                 margin: EdgeInsets.only(left: 12),
            //         //                 child: Text(
            //         //                   "Rs. 2000",
            //         //                   style: TextStyle(
            //         //                       color: textColor,
            //         //                       fontWeight: FontWeight.w500,
            //         //                       fontSize: 12),
            //         //                 ),
            //         //               ),
            //         //             ),
            //         //           ],
            //         //         ),
            //         //       ),
            //         //     ],
            //         //   ),
            //         // );
            //       }),
            // ),

            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/dot.png",
                        height: 48,
                        width: 48,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 270,
                        child: ShareButton(
                            title: "View & Download Ticket",
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (builder) => EditEvent()));
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
