import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormInputField(
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
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
    );
  }
}
