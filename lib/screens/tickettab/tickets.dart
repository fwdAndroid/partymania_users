import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/ticket_payment.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';

class Tickets extends StatefulWidget {
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
  Tickets(
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
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  multivalue(int a, int b) {
    int a = _counter;
    int b = int.parse(widget.eventPrice);
    int c = a * b;
    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(4.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.coupleValue
                                      .toString()
                                      .substring(6)
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Guestlist",
                                  style: TextStyle(
                                      color: textColor.withOpacity(.7),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Before ",
                                  style: TextStyle(color: grey),
                                ),
                                Text(
                                  widget.fromTime,
                                  style: TextStyle(color: grey),
                                ),
                              ],
                            ),
                            Text(
                              "Free",
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: _decrementCounter,
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: otpColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: textColor, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  border:
                                      Border.all(color: textColor, width: .5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '$_counter',
                                    style: TextStyle(
                                        color: textColor, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: _incrementCounter,
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: otpColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: textColor, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: textColor,
                    )
                  ],
                ),
              )),
          Flexible(child: Container()),
          Divider(
            color: textColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    print(multivalue(_counter, int.parse(widget.eventPrice)));
                  },
                  child: Text(
                    "Rs " +
                        multivalue(_counter, int.parse(widget.eventPrice))
                            .toString(),
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: textColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SaveButton(
                title: "Continue - Pay at venue",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => TicketPayment()));
                }),
          )
        ],
      ),
    );
  }
}
