import 'package:flutter/material.dart';
import 'package:partymania_users/screens/bookingtab/widget/upcomming_event_booking_list_view_widget.dart';
import 'package:partymania_users/utils/colors.dart';

class UpCommingEvents extends StatefulWidget {
  const UpCommingEvents({super.key});

  @override
  State<UpCommingEvents> createState() => _UpCommingEventsState();
}

class _UpCommingEventsState extends State<UpCommingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookingListViewWidget(),
        ),
      ),
    );
  }
}
