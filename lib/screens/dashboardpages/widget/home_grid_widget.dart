import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';

class HomeGridWidget extends StatefulWidget {
  const HomeGridWidget({super.key});

  @override
  State<HomeGridWidget> createState() => _HomeGridWidgetState();
}

class _HomeGridWidgetState extends State<HomeGridWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("events").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No Events Found yet",
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
                          .collection("events")
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
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (builder) => EventDetails(
                                    //               eventAmenities:
                                    //                   data['eventAmenities'],
                                    //               eventDate: data['eventDate'],
                                    //               eventCoverPhoto:
                                    //                   data['eventCoverPhoto'],
                                    //               eventDescription:
                                    //                   data['eventDescription'],
                                    //               eventLocation:
                                    //                   data['eventLocation'],
                                    //               fromTime: data['fromTime'],
                                    //               coupleValue:
                                    //                   data['coupleValue'],
                                    //               eventName: data['eventName'],
                                    //               uuid: data['uuid'],
                                    //               eventPhoto:
                                    //                   data['eventPhoto'],
                                    //               eventType: data['eventType'],
                                    //               nameOffer: data['nameOffer'],
                                    //               table: data['tables'],
                                    //               tickets: data['tickets'],
                                    //               timeDeadlineTicket: data[
                                    //                   'timeDeadlineTicket'],
                                    //             )));
                                  },
                                  child: Container(
                                    height: 150,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Image.network(
                                            data['eventCoverPhoto'],
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: textColor
                                                              .withOpacity(
                                                                  .80))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      data['eventDate'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: textColor
                                                              .withOpacity(
                                                                  .80))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "4.9",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
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
                                        data['eventName'],
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
                                              data['eventType'],
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
                                            data['eventLocation'],
                                            style: TextStyle(
                                                color: otpColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "RS",
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            data['eventPrice'].toString(),
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
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
