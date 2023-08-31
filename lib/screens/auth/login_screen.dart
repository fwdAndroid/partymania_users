import 'package:flutter/material.dart';
import 'package:partymania_users/screens/auth/getotp.dart';
import 'package:partymania_users/screens/auth/sign_up_account.dart';
import 'package:partymania_users/screens/main_dashboard.dart';
import 'package:partymania_users/services/auth_methods.dart';
import 'package:partymania_users/utils/button.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/utils/controllers.dart';
import 'package:partymania_users/utils/textformfield.dart';
import 'package:partymania_users/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    color: textColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login into your account",
                style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Email or Phone",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                      preIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/sms.png",
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      controller: loginEmailController,
                      hintText: "Enter Email or Phone",
                      textInputType: TextInputType.emailAddress),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                      suIcon: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => GetOtp()));
                          },
                          child: Text(
                            "Get OTP",
                            style: TextStyle(color: otpColor),
                          )),
                      preIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/lock.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                      controller: passwordController,
                      hintText: "Enter Password",
                      textInputType: TextInputType.emailAddress),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: SaveButton(
                      title: 'Login',
                      onTap: loginUser,
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account?",
                    style: TextStyle(
                        color: textColor.withOpacity(.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SignUpAccount()));
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().loginUpUser(
      email: loginEmailController.text,
      pass: passwordController.text,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    } else {
      showSnakBar(rse, context);
    }
  }
}
