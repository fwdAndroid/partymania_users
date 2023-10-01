import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_grid_widget.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_grid_widget_location.dart';
import 'package:partymania_users/screens/dashboardpages/widget/newestlistviewwidget.dart';
import 'package:partymania_users/screens/user_profile/book_serarch_screen.dart';
import 'package:partymania_users/screens/user_profile/bookmark.dart';
import 'package:partymania_users/screens/user_profile/filter_screen.dart';
import 'package:partymania_users/screens/user_profile/notifications.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partymania_users/utils/textformfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/logo.svg",
                width: 33,
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 12,
                    color: grey,
                  ),
                  Text(
                    "Bengaluru>",
                    style: TextStyle(color: grey, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => Notifications()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/notification.svg",
                width: 33,
                height: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => Bookmark()));
              ;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/bookmark.png",
                width: 28,
                height: 28,
              ),
            ),
          )
        ],
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: TextFormInputField(
                        preIcon: Icon(
                          Icons.search,
                          color: textColor,
                        ),
                        controller: controller,
                        hintText: "Search Events/Venue",
                        textInputType: TextInputType.text)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => BookSearchScreen()));
                  },
                  child: Image.asset(
                    "assets/booksearch.png",
                    height: 50,
                    width: 50,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => FilterScreen()));
                  },
                  child: Image.asset(
                    "assets/filter.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('events').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(); // Show loading indicator while fetching data
                  }

                  final documents = snapshot.data!.docs;

                  return CarouselSlider.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index, realIndex) {
                      final imageUrl = documents[index]['eventCoverPhoto'];
                      return Image.network(imageUrl,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          width: 1000);
                    },
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                  );
                },
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
                      "Trending",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: textColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HomeGridWidget(),
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
                      "Nearby Your Location",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: textColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HomeGridWidgetLocation(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Newest Events",
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: textColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            NewestListViewWidget()
          ],
        ),
      ),
    );
  }
}
