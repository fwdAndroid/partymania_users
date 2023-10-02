import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: 600,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        width: 235,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: textColor.withOpacity(.6))),
                        height: 130,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (builder) => ClubDetails()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          "assets/main.png",
                                          width: 100,
                                          height: 128,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Holy Night",
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16)),
                                                  border: Border.all(
                                                      color: otpColor)),
                                              height: 30,
                                              width: 50,
                                              child: Center(
                                                child: Text(
                                                  "Club",
                                                  style: TextStyle(
                                                      color: otpColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16)),
                                                  border: Border.all(
                                                      color: otpColor)),
                                              height: 30,
                                              width: 50,
                                              child: Center(
                                                child: Text(
                                                  "Bar",
                                                  style: TextStyle(
                                                      color: otpColor),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: otpColor,
                                            size: 15,
                                          ),
                                          Text(
                                            "Orilla, Pune",
                                            style: TextStyle(
                                                color: otpColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: 20,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(0xff4E4E4E),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                color:
                                                    textColor.withOpacity(.7),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "2 Km",
                                                style:
                                                    TextStyle(color: textColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )));
              }),
        ));
  }
}
