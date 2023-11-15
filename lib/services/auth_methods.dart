import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partymania_users/models/signup_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Get Users Details
  Future<SignUp_Model> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('users').doc(currentUser.uid).get();
    return SignUp_Model.fromSnap(documentSnapshot);
  }

  //Register User with Add User
  Future<String> signUpUser(
      {required String email,
      required String fullName,
      required String phone_Number,
      required String createPassword,
      required String dob,
      required final gender,
      required String confrimPassword}) async {
    String res = 'Email or Password is wrong ';
    try {
      if (email.isNotEmpty ||
          createPassword.isNotEmpty ||
          fullName.isNotEmpty ||
          confrimPassword.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: createPassword);
        //Add User to the database with modal
        SignUp_Model signUp_Model = SignUp_Model(
          following: [],
          fullName: fullName,
          uid: cred.user!.uid,
          email: email,
          gender: gender,
          dob: dob,
          phone_Number: phone_Number,
          confrimPassword: confrimPassword,
          createPassword: confrimPassword,
        );
        await firebaseFirestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(signUp_Model.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  ///Login User with Add Useer
  Future<String> loginUpUser({
    required String email,
    required String pass,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

        res = 'sucess';
      }
    } on FirebaseException catch (e) {
      if (e == 'WrongEmail') {
        print(e.message);
      }
      if (e == 'WrongPassword') {
        print(e.message);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await FirebaseFirestore.instance.collection('clubs').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await FirebaseFirestore.instance
            .collection('clubs')
            .doc(followId)
            .update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await FirebaseFirestore.instance.collection('clubs').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('clubs')
            .doc(followId)
            .update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await FirebaseFirestore.instance.collection('clubs').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
