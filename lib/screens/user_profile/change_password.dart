import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String _newPassword = '';
  TextEditingController _changePass = TextEditingController();
  TextEditingController _currentPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: backgroundColor,
        title: Text(
          'Change Password',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormInputField(
                textInputType: TextInputType.visiblePassword,
                hintText: "Current Password",
                controller: _currentPassword,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormInputField(
                textInputType: TextInputType.visiblePassword,
                hintText: "New Password",
                controller: _changePass,
                onChanged: (value) {
                  _newPassword = value;
                },
                validat: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: SaveButton(
                        onTap: _changePassword,
                        title: 'Change Password',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.currentUser!.updatePassword(_newPassword);
        // Password updated successfully
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => LoginScreen()));
        // You can show a success message or navigate to a different page
      } catch (e) {
        // Handle error
        print('Error changing password: $e');
      }
    }
  }
}
