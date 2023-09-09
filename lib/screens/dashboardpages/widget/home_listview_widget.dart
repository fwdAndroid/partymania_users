import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_details.dart';
import 'package:partymania_users/utils/colors.dart';

class HomeListViewWidget extends StatefulWidget {
  const HomeListViewWidget({super.key});

  @override
  State<HomeListViewWidget> createState() => _HomeListViewWidgetState();
}

class _HomeListViewWidgetState extends State<HomeListViewWidget> {
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
            return ListView.builder(
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
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    HomeDetails(
                                                      clubuid: data['uid'],
                                                      eventPrice:
                                                          data['eventPrice'],
                                                      eventAmenities: data[
                                                          'eventAmenities'],
                                                      eventDate:
                                                          data['eventDate'],
                                                      eventCoverPhoto: data[
                                                          'eventCoverPhoto'],
                                                      eventDescription: data[
                                                          'eventDescription'],
                                                      eventLocation:
                                                          data['eventLocation'],
                                                      fromTime:
                                                          data['fromTime'],
                                                      coupleValue:
                                                          data['coupleValue'],
                                                      eventName:
                                                          data['eventName'],
                                                      uuid: data['uuid'],
                                                      eventPhoto:
                                                          data['eventPhoto'],
                                                      eventType:
                                                          data['eventType'],
                                                      nameOffer:
                                                          data['nameOffer'],
                                                      table: data['tables'],
                                                      tickets: data['tickets'],
                                                      timeDeadlineTicket: data[
                                                          'timeDeadlineTicket'],
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
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  data['eventCoverPhoto'],
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
                                                data['eventName'],
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
                                                          "Music",
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
                                                    data['eventLocation'],
                                                    style: TextStyle(
                                                        color: otpColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                height: 20,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: textColor
                                                            .withOpacity(.80))),
                                                child: Text(
                                                  data['eventDate'],
                                                  style: TextStyle(
                                                      color: textColor
                                                          .withOpacity(.6)),
                                                  textAlign: TextAlign.center,
                                                ),
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
