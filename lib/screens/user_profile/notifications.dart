import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Today, March 21 2023",
              style: TextStyle(color: textColor),
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                          leading: Image.asset("assets/t.png"),
                          title: Text(
                            "Payment Successful",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            "You have successfully made a payment",
                            style: TextStyle(
                                color: textColor.withOpacity(.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: grey,
                          )),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
