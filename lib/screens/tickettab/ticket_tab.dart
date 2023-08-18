import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/tables.dart';
import 'package:partymania_users/screens/tickettab/tickets.dart';
import 'package:partymania_users/utils/colors.dart';

class TicketTab extends StatefulWidget {
  const TicketTab({super.key});

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
            Tickets(),
            Tables(),
          ],
        ),
      ),
    );
  }
}
