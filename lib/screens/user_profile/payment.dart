import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "Payments",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 400,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                        trailing: Text(
                          "3500.00",
                          style: TextStyle(color: textColor, fontSize: 15),
                        ),
                        title: Text(
                          "2 Tickets",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "23 march 2023",
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
      ]),
    );
  }
}
