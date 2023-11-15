import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/club_details.dart';
import 'package:partymania_users/utils/colors.dart';

class ClubGridWidget extends StatefulWidget {
  const ClubGridWidget({super.key});

  @override
  State<ClubGridWidget> createState() => _ClubGridWidgetState();
}

class _ClubGridWidgetState extends State<ClubGridWidget> {
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
              return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Set the number of items per row
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("clubs")
                          .orderBy("clubCity")
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: textColor)),
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => ClubDetails(
                                                  uid: FirebaseAuth.instance
                                                      .currentUser!.uid,
                                                  clubCity: data['clubCity'],
                                                  clubPhoneNumber:
                                                      data['clubPhoneNumber'],
                                                  clubCountry:
                                                      data['clubCountry'],
                                                  clubDescription:
                                                      data['clubDescription'],
                                                  clubLocation:
                                                      data['clubLocation'],
                                                  clubName: data['clubName'],
                                                  clubState: data['clubState'],
                                                  clubType: data['clubType'],
                                                  coverPhoto:
                                                      data['coverPhoto'],
                                                  clubid: data['uid'],
                                                  followers: data['followers']
                                                      .toString(),
                                                )));
                                  },
                                  child: Container(
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Image.network(
                                            data['coverPhoto'],
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data['clubName'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                              border:
                                                  Border.all(color: otpColor)),
                                          height: 30,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              data['clubType'],
                                              style: TextStyle(color: otpColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: otpColor,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            data['clubLocation'],
                                            style: TextStyle(
                                                color: otpColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
            }));
  }
}
