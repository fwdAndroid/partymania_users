import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/ticket_tab.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';

class HomeDetails extends StatefulWidget {
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
  HomeDetails({
    super.key,
    required this.artistType,
    required this.bird,
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
    required this.clubuid,
    required this.uuid,
  });

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
                child: Image.network(
                  widget.eventCoverPhoto,
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
                          style: TextStyle(color: textColor.withOpacity(.6)),
                          textAlign: TextAlign.center,
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
                    widget.eventTicketPrice.toString(),
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
                  subtitle: Row(
                    children: [
                      Text(
                        "Use Code:",
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      Text(
                        widget.offerName,
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
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
                    widget.fromEventDate,
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
                          widget.eventAmenities.toString(),
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
                          widget.eventTotalTickets,
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
                          widget.timeDeadlineTicket,
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
              // Center(
              //   child: Container(
              //     alignment: Alignment.center,
              //     width: 335,
              //     height: 80,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         border: Border.all(color: textColor, width: .3)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Image.asset(
              //             "assets/Rectangle 34624088.png",
              //             height: 60,
              //             width: 100,
              //           ),
              //           Align(
              //             alignment: AlignmentDirectional.centerStart,
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Tuborg Club",
              //                   style: TextStyle(
              //                       color: textColor,
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w400),
              //                 ),
              //                 SizedBox(
              //                   width: 10,
              //                 ),
              //                 Row(
              //                   children: [
              //                     Container(
              //                       width: 50,
              //                       height: 30,
              //                       decoration: BoxDecoration(
              //                           border: Border.all(color: otpColor),
              //                           borderRadius: BorderRadius.circular(15),
              //                           color: otpColor.withOpacity(.5)),
              //                       child: Center(
              //                         child: Text(
              //                           "Club",
              //                           style: TextStyle(
              //                               color: otpColor,
              //                               fontSize: 12,
              //                               fontWeight: FontWeight.w500),
              //                         ),
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Container(
              //                       width: 50,
              //                       height: 30,
              //                       decoration: BoxDecoration(
              //                           border: Border.all(color: otpColor),
              //                           borderRadius: BorderRadius.circular(15),
              //                           color: otpColor.withOpacity(.5)),
              //                       child: Center(
              //                         child: Text(
              //                           "Bar",
              //                           style: TextStyle(
              //                               color: otpColor,
              //                               fontSize: 12,
              //                               fontWeight: FontWeight.w500),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Icon(
              //             Icons.keyboard_arrow_right,
              //             color: textColor,
              //             size: 35,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
                              title: "RS " +
                                  widget.eventTicketPrice.toString() +
                                  " BookNow ",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => TicketTab(
                                              clubuid: widget.clubuid,
                                              eventPrice: widget
                                                  .eventTicketPrice
                                                  .toString(),
                                              eventAmenities:
                                                  widget.eventAmenities,
                                              eventDate: widget.eventStartDate,
                                              eventCoverPhoto:
                                                  widget.eventCoverPhoto,
                                              eventDescription:
                                                  widget.eventDescription,
                                              eventLocation:
                                                  widget.eventLocation,
                                              fromTime:
                                                  widget.eventTicketTimeBefore,
                                              coupleValue: widget.artistType,
                                              eventName: widget.eventName,
                                              uuid: widget.uuid,
                                              eventPhoto: widget.eventPhoto,
                                              eventType: widget.eventType,
                                              eventTicketSession:
                                                  widget.eventTicketSession,
                                              nameOffer: widget.offerName,
                                              table: widget.tableNumber,
                                              participantType:
                                                  widget.participantType,
                                              tickets: widget.eventTotalTickets,
                                              timeDeadlineTicket:
                                                  widget.timeDeadlineTicket,
                                            )));
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
        ));
  }
}
