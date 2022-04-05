import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/screens/loading_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/success_registration_screen.dart';
import 'package:xmeal/users/widgets/alert_boxes.dart';
import 'package:xmeal/waiter/screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureTextStatus = true;
  bool saving = false;
  final auth = FirebaseAuth.instance;
  String? registeredUsername;
  User? userCredentials;
  User? userData;
  bool? alreadyVisited;
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
      errorAlertMessage(context, 'Mobile number',
          'Mobile Number is already registered', () => Navigator.pop(context));
      manageProgress(false);
      return;
    }
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      var data = {
        'fullName': fullName,
        'profileImage': null,
        'description': null,
        'email': emailAddress,
        'mobileNumber': mobileNumber,
        'userType': userType,
        'timeStamp': DateTime.now(),
      };

      userCredentials = auth.currentUser;
      await users.doc(userCredentials!.uid).set(data).then((value) {
        registeredUsername = fullName;
        Navigator.pushReplacementNamed(context, RegistrationSuccessscreen.id);
        manageProgress(false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorAlertMessage(context, 'Email Error', 'Email is already registered',
            () => Navigator.pop(context));
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

// user login
  Future<void> loginUser(email, password, context) async {
    try {
      manageProgress(true);
      final signInUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (signInUser != '') {
        userData = auth.currentUser;
        var res = await users.doc(userData!.uid).get();
        if (res.exists) {
          Map<String, dynamic> data = res.data() as Map<String, dynamic>;
          var value = data['userType'];
          if (value == 'user') {
            Navigator.pushNamedAndRemoveUntil(
                context, LoadingScreen.id, (route) => false);
            manageProgress(false);
          } else if (value == 'admin') {
            Navigator.pushNamedAndRemoveUntil(
                context, WaiterHomeScreen.id, (route) => false);
            manageProgress(false);
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      manageProgress(false);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        errorAlertMessage(context, 'Opps Sorry',
            'Email or password is incorrect', () => Navigator.pop(context));
      }
    }
  }

// handle welcome screens

  void changeStatus() {
    alreadyVisited = true;
    notifyListeners();
    setVisitingFlag();
  }

  setVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('alreadyvisited', alreadyVisited!);
  }

  getVisitingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyVisited = prefs.getBool('alreadyvisited') ?? false;
    return alreadyVisited;
  }

//  user logout
  signoutUser(context) {
    auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
  }
}
