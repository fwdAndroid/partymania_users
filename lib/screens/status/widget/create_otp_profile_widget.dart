import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:partymania_users/screens/main_dashboard.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/textformfield.dart';
import 'package:partymania_users/utils/utils.dart';

class CreateOTPProfileWidget extends StatefulWidget {
  const CreateOTPProfileWidget({super.key});

  @override
  State<CreateOTPProfileWidget> createState() => _CreateOTPProfileWidgetState();
}

class _CreateOTPProfileWidgetState extends State<CreateOTPProfileWidget> {
  TextEditingController FullNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  bool _isLoading = false;
  var items = [
    'Male',
    'Female',
    'Others',
  ];
  String dropdownvalue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Create User Profile",
            style: TextStyle(
                fontSize: 24, color: textColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                preIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    "assets/frame.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Enter Full Name",
                controller: FullNameController,
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                preIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    "assets/email.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Email Address",
                controller: EmailController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormInputField(
                      onTap: () {
                        _selectDate(); // Call Function that has showDatePicker()
                      },
                      suIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/calendar.png",
                          width: 10,
                          height: 10,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      hintText: "Select DOB",
                      controller: DateController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: borderColor.withOpacity(.4)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              isDense: true,
                              icon: Image.asset(
                                "assets/Vector.png",
                                height: 18,
                                width: 18,
                              ),
                              value: dropdownvalue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(color: textColor),
                                  ),
                                );
                              }).toList(),
                              dropdownColor:
                                  Colors.black, //dropdown background color

                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SaveButton(
                    title: "SignUp",
                    onTap: () async {
                      if (FullNameController.text.isEmpty ||
                          EmailController.text.isEmpty) {
                        showSnakBar("All Fields are required", context);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        await FirebaseFirestore.instance
                            .collection("user")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({
                          "email": EmailController.text,
                          "phone_Number": FirebaseAuth
                              .instance.currentUser!.phoneNumber!
                              .toString(),
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "gender": dropdownvalue,
                          "dob": DateController.text,
                          "fullName": FullNameController.text,
                          "folowing": [],
                        });
                        setState(() {
                          _isLoading = false;
                        });
                        showSnakBar("Profile Created", context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MainScreen()));
                      }
                    })),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  void _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        DateController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
