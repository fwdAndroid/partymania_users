import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_details.dart';
import 'package:partymania_users/screens/user_profile/bookmark.dart';
import 'package:partymania_users/screens/user_profile/filter_screen.dart';
import 'package:partymania_users/screens/user_profile/notifications.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/textformfield.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController dateStartController = TextEditingController();
  TextEditingController dateEndController = TextEditingController();
  bool isShowUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                width: 33,
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 12,
                    color: grey,
                  ),
                  Text(
                    "Bengaluru>",
                    style: TextStyle(color: grey, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => Notifications()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/notification.svg",
                width: 33,
                height: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Bookmark()));
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/bookmark.png",
                width: 28,
                height: 28,
              ),
            ),
          )
        ],
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: TextFormInputField(
                        onFieldSubmited: (s) {
                          setState(() {
                            isShowUser = true;
                          });
                        },
                        preIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isShowUser = true;
                            });
                          },
                          child: Icon(
                            Icons.search,
                            color: textColor,
                          ),
                        ),
                        controller: controller,
                        hintText: "Search Events/Venue",
                        textInputType: TextInputType.text)),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => FilterScreen()));
                  },
                  child: Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/filter.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextFormInputField(
          //             onTap: () async {
          //               await showDatePicker(
          //                 context: context,
          //                 initialDate: DateTime.now(),
          //                 firstDate: DateTime(1900),
          //                 lastDate: DateTime(2025),
          //               ).then((selectedDate) {
          //                 if (selectedDate != null) {
          //                   dateStartController.text =
          //                       DateFormat('yyyy-MM-dd').format(selectedDate);
          //                 }
          //               });
          //             },
          //             suIcon: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Image.asset(
          //                 "assets/calendar.png",
          //                 height: 20,
          //                 width: 20,
          //               ),
          //             ),
          //             controller: dateStartController,
          //             hintText: "From",
          //             textInputType: TextInputType.text),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Expanded(
          //         child: TextFormInputField(
          //             onTap: () async {
          //               await showDatePicker(
          //                 context: context,
          //                 initialDate: DateTime.now(),
          //                 firstDate: DateTime(1900),
          //                 lastDate: DateTime(2025),
          //               ).then((selectedDate) {
          //                 if (selectedDate != null) {
          //                   dateEndController.text =
          //                       DateFormat('yyyy-MM-dd').format(selectedDate);
          //                 }
          //               });
          //             },
          //             suIcon: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Image.asset(
          //                 "assets/calendar.png",
          //                 height: 20,
          //                 width: 20,
          //               ),
          //             ),
          //             controller: dateEndController,
          //             hintText: "To",
          //             textInputType: TextInputType.text),
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Expanded(
          //         child: ElevatedButton(
          //           onPressed: () {},
          //           child: Text(
          //             "Apply",
          //             style: TextStyle(color: textColor, fontSize: 12),
          //           ),
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: otpColor,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10.0),
          //               ),
          //               fixedSize: Size(70, 32)),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 480,
            child: isShowUser
                ? SizedBox(
                    height: 252,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("events")
                            .where("eventName",
                                isGreaterThanOrEqualTo: controller.text)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                "No Events Found yet",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return StreamBuilder<Object>(
                                    stream: FirebaseFirestore.instance
                                        .collection("events")
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      final List<DocumentSnapshot> documents =
                                          snapshot.data!.docs;
                                      final Map<String, dynamic> data =
                                          documents[index].data()
                                              as Map<String, dynamic>;
                                      return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              width: 235,
                                              decoration: BoxDecoration(
                                                  color: backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: textColor
                                                          .withOpacity(.6))),
                                              height: 130,
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (builder) =>
                                                                      HomeDetails(
                                                                        clubuid:
                                                                            data['uid'],
                                                                        eventAmenities:
                                                                            data['eventAmenities'],
                                                                        eventCoverPhoto:
                                                                            data['eventCoverPhoto'],
                                                                        eventDescription:
                                                                            data['eventDescription'],
                                                                        eventLocation:
                                                                            data['eventLocation'],
                                                                        artistType:
                                                                            data['artistType'],
                                                                        bird: data[
                                                                            'bird'],
                                                                        dayNight:
                                                                            data['dayNight'],
                                                                        eventName:
                                                                            data['eventName'],
                                                                        eventPhoto:
                                                                            data['eventPhoto'],
                                                                        eventStartDate:
                                                                            data['eventStartDate'],
                                                                        eventTicketPrice:
                                                                            data['eventTicketPrice'],
                                                                        eventTicketSession:
                                                                            data['eventTicketSession'],
                                                                        eventTicketTimeBefore:
                                                                            data['eventTicketTimeBefore'],
                                                                        eventTotalTickets:
                                                                            data['eventTotalTickets'],
                                                                        eventType:
                                                                            data['eventType'],
                                                                        uuid: data[
                                                                            'uuid'],
                                                                        fromEventDate:
                                                                            data['fromEventDate'],
                                                                        numofPeople:
                                                                            data['numofPeople'],
                                                                        offerCode:
                                                                            data['offerCode'],
                                                                        offerName:
                                                                            data['offerName'],
                                                                        participantType:
                                                                            data['participantType'],
                                                                        tableNumber:
                                                                            data['tableNumber'],
                                                                        tablePrice:
                                                                            data['tablePrice'].toString(),
                                                                        tableType:
                                                                            data['tableType'],
                                                                        ticketPurchase:
                                                                            data['ticketPurchase'].toString(),
                                                                        timeDeadlineTicket:
                                                                            data['timeDeadlineTicket'],
                                                                        toEventDate:
                                                                            data['toEventDate'],
                                                                        totaltables:
                                                                            data['totaltables'].toString(),
                                                                      )));
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.network(
                                                                data[
                                                                    'eventCoverPhoto'],
                                                                width: 100,
                                                                height: 128,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 30,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              data['eventName'],
                                                              style: TextStyle(
                                                                  color:
                                                                      textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14),
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                16)),
                                                                        border: Border.all(
                                                                            color:
                                                                                otpColor)),
                                                                    height: 30,
                                                                    width: 50,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        data[
                                                                            'eventType'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                otpColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    )),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Image.asset(
                                                                  "assets/Auto Layout Horizontal.png",
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .location_pin,
                                                                  color:
                                                                      otpColor,
                                                                  size: 15,
                                                                ),
                                                                Text(
                                                                  data[
                                                                      'eventLocation'],
                                                                  style: TextStyle(
                                                                      color:
                                                                          otpColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                              height: 20,
                                                              width: 150,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: textColor
                                                                          .withOpacity(
                                                                              .80))),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    data[
                                                                        'eventStartDate'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Text(
                                                                    data[
                                                                        'fromEventDate'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )));
                                    });
                              });
                        }),
                  )
                : Center(
                    child: Text(
                    "No Event Found",
                    style: TextStyle(color: Colors.white),
                  )),
          )
        ],
      ),
    );
  }
}
