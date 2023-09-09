import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/club_details.dart';
import 'package:partymania_users/utils/colors.dart';

class ClubListViewWidget extends StatefulWidget {
  const ClubListViewWidget({super.key});

  @override
  State<ClubListViewWidget> createState() => _ClubListViewWidgetState();
}

class _ClubListViewWidgetState extends State<ClubListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("clubs").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "No Club Found yet",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("clubs")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: 235,
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: textColor.withOpacity(.6))),
                                height: 130,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  data['coverPhoto'],
                                                  width: 100,
                                                  height: 128,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['clubName'],
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
                                                                  Radius
                                                                      .circular(
                                                                          16)),
                                                          border: Border.all(
                                                              color: otpColor)),
                                                      height: 30,
                                                      width: 50,
                                                      child: Center(
                                                        child: Text(
                                                          data['clubType'],
                                                          style: TextStyle(
                                                              color: otpColor),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Image.asset(
                                                    "assets/Auto Layout Horizontal.png",
                                                  )
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
                                                    data['clubLocation'],
                                                    style: TextStyle(
                                                        color: otpColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )));
                      });
                });
          }),
    );
  }
}
