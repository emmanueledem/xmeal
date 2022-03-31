import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:xmeal/users/services/utilities/format_date.dart';

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

  // void manageProgress(value) {
  //   saving = value;
  //   notifyListeners();
  // }

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
}
