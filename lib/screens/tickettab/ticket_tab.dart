import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/tables.dart';
import 'package:partymania_users/screens/tickettab/tickets.dart';
import 'package:partymania_users/utils/colors.dart';

class TicketTab extends StatefulWidget {
  final uuid;
  final clubuid;
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
  TicketTab(
      {super.key,
      required this.eventAmenities,
      required this.clubuid,
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
  State<TicketTab> createState() => _TicketTabState();
}

class _TicketTabState extends State<TicketTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: backgroundColor,
          bottom: TabBar(
            labelColor: textColor,
            unselectedLabelColor: textColor.withOpacity(.7),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(9), color: otpColor),
            tabs: [
              Tab(
                text: "Tickets",
              ),
              Tab(
                text: "Tables",
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Buy Tickets',
            style: TextStyle(color: textColor),
          ),
        ),
        body: TabBarView(
          children: [
            Tickets(
              clubUid: widget.clubuid,
              eventPrice: widget.eventPrice.toString(),
              eventAmenities: widget.eventAmenities,
              eventDate: widget.eventDate,
              eventCoverPhoto: widget.eventCoverPhoto,
              eventDescription: widget.eventDescription,
              eventLocation: widget.eventLocation,
              fromTime: widget.fromTime,
              coupleValue: widget.coupleValue,
              eventName: widget.eventName,
              uuid: widget.uuid,
              eventPhoto: widget.eventPhoto,
              eventType: widget.eventType,
              nameOffer: widget.nameOffer,
              table: widget.table,
              tickets: widget.tickets,
              timeDeadlineTicket: widget.timeDeadlineTicket,
            ),
            Tables(),
          ],
        ),
      ),
    );
  }
}
