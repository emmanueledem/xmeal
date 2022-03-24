import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xmeal/users/widgets/error_alert.dart';
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

  Future createUser(
      fullName, emailAddress, mobileNumber, userType, password, context) async {
    manageProgress(true);
    final phoneExist = await checkPhone(mobileNumber);
    if (phoneExist) {
      errorAlertMessage(
          context, 'Mobile number', 'Mobile Number is already registered');
      manageProgress(false);
      return;
    }
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      var data = {
        'fullName': fullName,
        'email': emailAddress,
        'mobileNumber': mobileNumber,
        'userType': userType,
      };

      userCredentials = auth.currentUser;
      await users.doc(userCredentials!.uid).set(data).then((value) {
        Navigator.pushReplacementNamed(context, RegistrationSuccessscreen.id);
        manageProgress(false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorAlertMessage(
            context, 'Email Error', 'Email is already registered');
        manageProgress(false);
      }
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }

  Future<bool> checkPhone(mobileNumber) async {
    var res = await users.where('mobileNumber', isEqualTo: mobileNumber).get();
    return res.docs.isNotEmpty;
  }
}
