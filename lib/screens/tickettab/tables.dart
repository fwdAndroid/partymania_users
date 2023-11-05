import 'package:flutter/material.dart';
import 'package:partymania_users/screens/tickettab/table/table_payment.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Image.asset(
            "assets/Rectangle 34624118.png",
            width: 300,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
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
                                          "Table 1",
                                          style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "for 6 people",
                                          style: TextStyle(
                                              color: textColor.withOpacity(.7),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Before 9:30PM",
                                      style: TextStyle(color: grey),
                                    ),
                                    Text(
                                      "Rs, 12,000",
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
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: otpColor),
                                    onPressed: () {},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: textColor),
                                    ))
                              ],
                            ),
                            Divider(
                              color: textColor,
                            )
                          ],
                        ),
                      ));
                }),
          ),
          Divider(
            color: textColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount:",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs. 7,000.00:",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
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
                title: "Continue - Book Now",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => TablePayment()));
                }),
          )
        ],
      ),
    );
  }
}
