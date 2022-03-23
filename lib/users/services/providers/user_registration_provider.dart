import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../screens/welcome_screens/success_registration_screen.dart';

class UserRegistration extends ChangeNotifier {
  bool obscureTextStatus = true;
  bool saving = false;
  final auth = FirebaseAuth.instance;
  User? userCredentials;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void passwordToggle() {
    if (obscureTextStatus == true) {
      obscureTextStatus = false;
    } else if (obscureTextStatus == false) {
      obscureTextStatus = true;
    }
    notifyListeners();
  }

  void manageProgress(value) {
    saving = value;
    notifyListeners();
  }

  void createUser(
      fullName, emailAddress, mobileNumber, userType, password, context) async {
    manageProgress(true);
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      var data = {
        'fullName': fullName,
        'email': emailAddress,
        'mobilnumber': mobileNumber,
        'userType': userType,
      };
      userCredentials = auth.currentUser;
      await users.doc(userCredentials!.uid).set(data).then((value) {
        Navigator.pushReplacementNamed(context, RegistrationSuccessscreen.id);
        manageProgress(false);
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
