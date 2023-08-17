import 'package:flutter/material.dart';
import 'package:partymania_users/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/edit.png",
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Wick",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/email.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "johnwick@gmail.com",
                              style: TextStyle(color: grey),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/call.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "+91 12325 12325",
                              style: TextStyle(color: grey),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/medal.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Referral Code:",
                              style: TextStyle(color: grey),
                            ),
                            Text(
                              "JOHN121",
                              style: TextStyle(color: textColor),
                            ),
                            Text(
                              " Copy Code",
                              style: TextStyle(color: otpColor),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 335,
              height: 60,
              decoration: BoxDecoration(
                  color: Color(0xff4E4E4E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: textColor, width: .3)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet Current Balance",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(
                              "Rs. 450.00",
                              style: TextStyle(
                                  color: otpColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "23 March 2023",
                              style: TextStyle(
                                  color: grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: textColor,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => EditUserProfile()));
              },
              leading: Image.asset(
                "assets/empty-wallet.png",
                width: 30,
                height: 30,
              ),
              title: Text(
                "Manage Wallets",
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => EditUserProfile()));
              },
              leading: Image.asset(
                "assets/frame.png",
                width: 30,
                height: 30,
              ),
              title: Text(
                "Edit Profile Details",
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (builder) => EditUserClubProfile()));
              },
              leading: Image.asset(
                "assets/money.png",
                width: 30,
                height: 30,
              ),
              title: Text(
                "Payments",
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (builder) => Settings()));
              },
              leading: Icon(
                Icons.settings,
                size: 30,
                color: textColor,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "assets/message-question.png",
                width: 30,
                height: 30,
              ),
              title: Text(
                "Help & Support",
                style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: textColor.withOpacity(.7),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Invite your Friends",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Get 150 Rupees When your friend activates\ntheir account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/Group 14436.png",
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/Twitter.png",
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/Instagram.png",
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  "assets/LinkedIn.png",
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/WhatsApp.png",
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  "assets/Facebook.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/Group 14574.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
