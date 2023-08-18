import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partymania_users/screens/dashboardpages/widget/home_listview_widget.dart';
import 'package:partymania_users/screens/user_profile/bookmark.dart';
import 'package:partymania_users/screens/user_profile/filter_screen.dart';
import 'package:partymania_users/screens/user_profile/notifications.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => BookSearchScreen()));
                  },
                  child: Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/booksearch.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => FilterScreen()));
                  },
                  child: Expanded(
                    flex: 1,
                    child: Image.asset(
                      "assets/filter.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormInputField(
                      suIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/calendar.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      controller: typeControllerBookFromDate,
                      hintText: "From",
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormInputField(
                      suIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/calendar.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      controller: typeControllerBookToDate,
                      hintText: "To",
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Apply",
                      style: TextStyle(color: textColor, fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: otpColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize: Size(100, 32)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Container(height: 500, child: HomeListViewWidget()),
          )
        ],
      ),
    );
  }
}
