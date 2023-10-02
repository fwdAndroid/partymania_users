import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/clubtab/seeAll.dart';
import 'package:partymania_users/screens/clubtab/widgets/club_grid_widget.dart';
import 'package:partymania_users/screens/clubtab/widgets/club_list_view_widget.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/textformfield.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  TextEditingController controller = TextEditingController();
  bool isShowUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 670,
          child: isShowUser
              ? StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("clubs")
                      .where("clubName",
                          isGreaterThanOrEqualTo: controller.text)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    }

                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              // var data = snapshot.data!.docs[index];

                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => BusinessView(
                              //           data: data,
                              //         )));
                            },
                            title: Text(
                              documents[index]['clubName'],
                              style: TextStyle(color: textColor),
                            ),
                            subtitle: Text(documents[index]['clubLocation'],
                                style: TextStyle(color: textColor)),
                          );
                        },
                      ),
                    );
                  },
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormInputField(
                        onFieldSubmited: (s) {
                          setState(() {
                            isShowUser = true;
                          });
                        },
                        preIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isShowUser = true;
                            });
                          },
                          child: Icon(
                            Icons.search,
                            color: textColor,
                          ),
                        ),
                        controller: controller,
                        hintText: "Search Club",
                        textInputType: TextInputType.text,
                        suIcon: Icon(
                          Icons.search,
                          color: textColor.withOpacity(.4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Near By Clubs",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => ClubSeeAll()));
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClubGridWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Clubs",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => ClubSeeAll()));
                                },
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: textColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClubListViewWidget(),
                    ],
                  ),
                ),
        ));
  }
}
