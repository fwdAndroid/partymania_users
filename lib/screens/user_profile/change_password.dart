import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partymania_users/screens/auth/login_screen.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/textformfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newConfrimPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          centerTitle: true,
          title: Text(
            "Change Password",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          backgroundColor: backgroundColor,
        ),
        backgroundColor: backgroundColor,
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please enter your email address so that an link can be sent to change your password",
                          style: TextStyle(
                              color: Color(0xffF9FAFB),
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormInputField(
                          textInputType: TextInputType.text,
                          hintText: "Enter Email Address",
                          controller: newConfrimPassword,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: SaveButton(
                          title: "Change Password",
                          onTap: () async {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: newConfrimPassword.text)
                                .then((value) => {
                                      FirebaseAuth.instance.signOut(),
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  LoginScreen()))
                                    });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Email verification link is sent")));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
