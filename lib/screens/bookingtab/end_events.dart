import 'package:flutter/material.dart';
import 'package:partymania_users/screens/bookingtab/widget/past_event_widget.dart';
import 'package:partymania_users/utils/colors.dart';

class EndEvents extends StatefulWidget {
  const EndEvents({super.key});

  @override
  State<EndEvents> createState() => _EndEventsState();
}

class _EndEventsState extends State<EndEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PastEventWidget(),
        ),
      ),
    );
  }
}
