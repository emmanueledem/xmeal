import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:xmeal/services/utilities/format_date.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

class ProfileProvider extends ChangeNotifier {
  String? imageUrl;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? description;
  Timestamp? dateJoined;
  String? finalDate;
  bool saving = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? updateResponse;

  void manageProgress(value) {
    saving = value;
    notifyListeners();
  }

  Future fetchUserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final auth = FirebaseAuth.instance;
    var res = await users.doc(auth.currentUser!.uid).get();
    Map<String, dynamic> data = res.data() as Map<String, dynamic>;
    imageUrl = data['profileImage'];
    fullName = data['fullName'];
    email = data['email'];
    phoneNumber = data['mobileNumber'];
    description = data['description'];
    dateJoined = data['timeStamp'];

    DateTime convertedDate =
        DateTime.fromMillisecondsSinceEpoch(dateJoined!.seconds * 1000);
    FormatDateUtils dateReg = FormatDateUtils();
    finalDate = dateReg.dateRefactor(convertedDate);
    notifyListeners();
  }

  updateProfileImage(value) async {
    Map<String, dynamic> map = {};
    if (value != null) {
      String url = await uploadImage(value);
      map['profileImage'] = url;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(map);
    await fetchUserData();
    //
  }

  Future<String> uploadImage(value) async {
    Random random = Random();
    int randomNumber = random.nextInt(100 * 8000);
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profileImage")
        .child(FirebaseAuth.instance.currentUser!.uid +
            randomNumber.toString() +
            basename(value!.path))
        .putFile(value!);

    return taskSnapshot.ref.getDownloadURL();
  }

  Future updateUserData(newfullName, newmobileNumber, newdescription) async {
    Map<String, dynamic> dataMap = {};
    dataMap['fullName'] = newfullName;
    dataMap['mobileNumber'] = newmobileNumber;
    dataMap['description'] = newdescription;
    manageProgress(true);
    await users
        .where('mobileNumber', isEqualTo: newmobileNumber)
        .get()
        .then((value) async {
      if (value.docs.isEmpty) {
        await users.doc(auth.currentUser!.uid).update(dataMap);
        await fetchUserData();
        manageProgress(false);
        updateResponse = 'Profile Updatded Successfully';
      } else {
        for (var element in value.docs) {
          if (element.id == auth.currentUser!.uid) {
            await users.doc(auth.currentUser!.uid).update(dataMap);
            await fetchUserData();
            manageProgress(false);
            updateResponse = 'Profile Updatded Successfully';
          } else if (element.id != auth.currentUser!.uid) {
            manageProgress(false);
            updateResponse = 'opps! Phone Number already taken';
          }
        }
      }
    });
    notifyListeners();
  }
}
