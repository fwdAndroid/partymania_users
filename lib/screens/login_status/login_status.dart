import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_users/screens/auth/login_screen.dart';
import 'package:partymania_users/screens/auth/sign_up_account.dart';

class LoginStatus extends StatefulWidget {
  const LoginStatus({super.key});

  @override
  State<LoginStatus> createState() => _LoginStatusState();
}

class _LoginStatusState extends State<LoginStatus> {
  @override
  void initState() {
    // TODO: implement initState
    checkresult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Verifying Users"),
      ),
    );
  }

  void checkresult() async {
    final doc = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;

    if (doesDocExist) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => LoginScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => SignUpAccount()));
    }
  }
}
