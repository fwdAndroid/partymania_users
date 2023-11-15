import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/club_details.dart';
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
          height: 250,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("clubs")
                  .where("followers", isNotEqualTo: []).snapshots(),
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
                              .where("followers", isNotEqualTo: []).snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
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
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (builder) =>
                                                        ClubDetails(
                                                          clubid: data['uid'],
                                                          clubCity:
                                                              data['clubCity'],
                                                          clubCountry: data[
                                                              'clubCountry'],
                                                          clubDescription: data[
                                                              'clubDescription'],
                                                          clubLocation: data[
                                                              'clubLocation'],
                                                          clubName:
                                                              data['clubName'],
                                                          clubState:
                                                              data['clubState'],
                                                          clubType:
                                                              data['clubType'],
                                                          coverPhoto: data[
                                                              'coverPhoto'],
                                                          clubPhoneNumber: data[
                                                              'clubPhoneNumber'],
                                                          uid: FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid,
                                                          followers:
                                                              data['followers']
                                                                  .toString(),
                                                        )));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          16)),
                                                              border: Border.all(
                                                                  color:
                                                                      otpColor)),
                                                          height: 30,
                                                          width: 50,
                                                          child: Center(
                                                            child: Text(
                                                              data['clubType'],
                                                              style: TextStyle(
                                                                  color:
                                                                      otpColor),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
        ));
  }
}
