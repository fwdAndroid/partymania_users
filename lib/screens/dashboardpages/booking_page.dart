import 'package:flutter/material.dart';
import 'package:partymania_users/screens/bookingtab/end_events.dart';
import 'package:partymania_users/screens/bookingtab/upcomming_events.dart';
import 'package:partymania_users/utils/colors.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
                text: "Upcoming Events",
              ),
              Tab(
                text: "Ended Events",
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          title: Text(
            'Bookings',
            style: TextStyle(color: textColor),
          ),
        ),
        body: TabBarView(
          children: [
            UpCommingEvents(),
            EndEvents(),
          ],
        ),
      ),
    );
  }
}
