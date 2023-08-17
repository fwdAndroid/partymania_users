import 'package:flutter/material.dart';
import 'package:partymania_users/screens/main_dashboard.dart';
import 'package:partymania_users/utils/button.dart';

import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Edit Profile Details",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
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
                      controller: editProfileFullNameController,
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
                      suIcon: TextButton(
                        child: Text(
                          "Verified",
                          style: TextStyle(color: Colors.green),
                        ),
                        onPressed: () {},
                      ),
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
                      controller: editProfileEmailController,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormInputField(
                      suIcon: TextButton(
                        child: Text(
                          "Verify",
                          style: TextStyle(color: Color(0xff1777F2)),
                        ),
                        onPressed: () {},
                      ),
                      preIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/call.png",
                          width: 10,
                          height: 10,
                        ),
                      ),
                      textInputType: TextInputType.number,
                      hintText: "424-232-000",
                      controller: editPhoneController,
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
                            controller: editDob,
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
                          TextFormInputField(
                            suIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset(
                                "assets/Vector.png",
                                width: 10,
                                height: 10,
                              ),
                            ),
                            textInputType: TextInputType.text,
                            hintText: "Male",
                            controller: editGender,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: SaveButton(
                      title: 'Save',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MainScreen()));
                      })),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
