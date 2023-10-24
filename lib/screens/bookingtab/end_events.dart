import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("bookings")
                    .where("uid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No Booking Found yet"),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection("bookings")
                                .where("uid",
                                    isEqualTo:
                                        FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final List<DocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              final Map<String, dynamic> data = documents[index]
                                  .data() as Map<String, dynamic>;
                              return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      width: 235,
                                      decoration: BoxDecoration(
                                          color: backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color:
                                                  textColor.withOpacity(.6))),
                                      height: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Name: " + data['name'],
                                            style: TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Email: " + data['email'],
                                            style: TextStyle(
                                                color: textColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            "Phone: " + data['phone'],
                                            style: TextStyle(
                                                color: otpColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Number of Seats: " +
                                                data['seats'].toString(),
                                            style: TextStyle(
                                                color:
                                                    textColor.withOpacity(.6)),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            "Costs: " + data['cost'].toString(),
                                            style: TextStyle(
                                                color:
                                                    textColor.withOpacity(.6)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )));
                            });
                      });
                }),
          ),
        ),
      ),
    );
  }
}
