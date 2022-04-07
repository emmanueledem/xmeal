import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DishesProvider extends ChangeNotifier {
  bool saving = false;
  final auth = FirebaseAuth.instance;
  String? updateResponse;
  void manageProgress(value) {
    saving = value;
    notifyListeners();
  }

  Future createDish(
      dishName, dishRegion, dishprice, dishdescription, file) async {
    manageProgress(true);
    CollectionReference dishes =
        FirebaseFirestore.instance.collection('dishes');
    String url = await uploadImage(file);
    String userId = auth.currentUser!.uid;
    var data = {
      'createdBy': userId,
      'dishImage': url,
      'dishName': dishName,
      'dishRegion': dishRegion,
      'dishprice': dishprice,
      'dishdescription': dishdescription,
      'dateCreated': DateTime.now(),
    };

    var random = Random.secure();
    var value = random.nextInt(100000000 * 40);
    await dishes.doc(value.toString()).set(data).then((value) {
      manageProgress(false);
      updateResponse = 'Dish added Succesfully !';
    });
    notifyListeners();
  }

  Future<String> uploadImage(file) async {
    Random random = Random();
    int randomNumber = random.nextInt(100 * 8000);
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("dishImages")
        .child(FirebaseAuth.instance.currentUser!.uid +
            randomNumber.toString() +
            basename(file!.path))
        .putFile(file!);

    return taskSnapshot.ref.getDownloadURL();
  }
}
