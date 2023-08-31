import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp_Model {
  String uid;
  String email;
  String fullName;
  String phone_Number;
  final gender;
  String dob;
  String createPassword;
  String confrimPassword;

  SignUp_Model(
      {required this.uid,
      required this.email,
      required this.fullName,
      required this.gender,
      required this.dob,
      required this.createPassword,
      required this.confrimPassword,
      required this.phone_Number});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'phone_Number': phone_Number,
        'uid': uid,
        'email': email,
        "gender": gender,
        'fullName': fullName,
        'dob': dob,
        'confrimPassword': confrimPassword,
        'createPassword': createPassword
      };

  ///
  static SignUp_Model fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return SignUp_Model(
      phone_Number: snapshot['phone_Number'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      dob: snapshot['dob'],
      gender: snapshot['gender'],
      createPassword: snapshot['createPassword'],
      fullName: snapshot['fullName'],
      confrimPassword: snapshot['confrimPassword'],
    );
  }
}
