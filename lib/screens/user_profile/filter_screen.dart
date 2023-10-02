import 'package:flutter/material.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String radioButtonItem = 'Day';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "Filters",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Day';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'Day',
                    style: new TextStyle(fontSize: 17.0, color: textColor),
                  ),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Night';
                        id = 2;
                      });
                    },
                  ),
                  Text(
                    'Night',
                    style: new TextStyle(fontSize: 17.0, color: textColor),
                  ),
                  Radio(
                    value: 3,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Both';
                        id = 3;
                      });
                    },
                  ),
                  Text(
                    'Both',
                    style: new TextStyle(fontSize: 17.0, color: textColor),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Type",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormInputField(
                    suIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Add",
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
                    controller: typeController,
                    hintText: "Add Type",
                    textInputType: TextInputType.text),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Rating",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Price",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormInputField(
                          controller: typeControllerFrom,
                          hintText: "From",
                          textInputType: TextInputType.text),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormInputField(
                          controller: typeControllerTo,
                          hintText: "To",
                          textInputType: TextInputType.text),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Date",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
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
                          controller: typeControllerFromDate,
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
                          controller: typeControllerToDate,
                          hintText: "To",
                          textInputType: TextInputType.text),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/Group 14482.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ShareButton(
                        title: "Clear",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child: SaveButton(title: "Apply", onTap: () {}))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
