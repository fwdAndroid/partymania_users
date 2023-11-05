import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/responsive/responsive_layout.dart';
import 'package:partymania_users/screens/auth/login_screen.dart';
import 'package:partymania_users/utils/colors.dart';
import 'package:partymania_users/web_module/web_auth/web_login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    check(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/splash.gif")],
      ),
    );
  }
}

check(BuildContext context) {
  final User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                      mobileScreenLayout: LoginScreen(),
                      webScreenLayout: WebLoginScreen(),
                    ))));
  } else {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                      mobileScreenLayout: LoginScreen(),
                      webScreenLayout: WebLoginScreen(),
                    ))));
  }
}
