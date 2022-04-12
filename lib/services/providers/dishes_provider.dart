import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

class DishesProvider extends ChangeNotifier {
  bool saving = false;
  final auth = FirebaseAuth.instance;
  String? updateResponse;
  CollectionReference dishes = FirebaseFirestore.instance.collection('dishes');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference dishviewers =
      FirebaseFirestore.instance.collection('dishViewers');
  CollectionReference favoriteDish =
      FirebaseFirestore.instance.collection('favoriteDish');
  bool? favoriteDishStatus;
  String? viewedDishesId;

  void manageProgress(value) {
    saving = value;
    notifyListeners();
  }

  Future createDish(
      dishName, dishRegion, dishprice, dishdescription, file) async {
    manageProgress(true);

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

    await dishes.doc().set(data).then((value) {
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

  Future dishViewers(dishId, dishViewsCount) async {
    String? userId;
    userId = _auth.currentUser!.uid;
    var updateViews = {'dishViews': dishViewsCount + 1};
    await dishes.doc(dishId).update(updateViews);

    final res = await confirmDishViews(dishId, userId);
    if (res) {
      var data = {
        'dishId': dishId,
        'viewedBy': userId,
        'dateViewed': DateTime.now(),
      };
      await dishviewers.doc().set(data);
    }
    notifyListeners();
  }

  Future<bool> confirmDishViews(dishId, userId) async {
    var res = await dishviewers
        .where('dishId', isEqualTo: dishId)
        .where('viewedBy', isEqualTo: userId)
        .get();
    return res.docs.isEmpty;
  }

  Future<void> checkIfFavotite(dishId) async {
    String? userId;
    userId = _auth.currentUser!.uid;
    var res = await favoriteDish
        .where('dishId', isEqualTo: dishId)
        .where('viewedBy', isEqualTo: userId)
        .get();
    if (res.docs.isNotEmpty) {
      favoriteDishStatus = true;
    } else if (res.docs.isEmpty) {
      favoriteDishStatus = false;
    }
    notifyListeners();
  }

  Future<void> favoriteDishes(dishId) async {
    String? userId;
    userId = _auth.currentUser!.uid;
    await favoriteDish
        .where('viewedBy', isEqualTo: userId)
        .where('dishId', isEqualTo: dishId)
        .get()
        .then((value) async {
      if (value.docs.isEmpty) {
        var data = {
          'dishId': dishId,
          'viewedBy': userId,
          'dateViewed': DateTime.now(),
        };
        await favoriteDish.doc().set(data);
        favoriteDishStatus = true;
      } else {
        for (var element in value.docs) {
          if (value.docs.isNotEmpty) {
            await favoriteDish.doc(element.id).delete();
            favoriteDishStatus = false;
          }
        }
      }
    });
    notifyListeners();
  }

  Future<void> fetchViewedDishes() async {
    String? userId;
    userId = _auth.currentUser!.uid;
    await dishviewers.where('viewedBy', isEqualTo: userId).get().then((value) {
      for (var userKey in value.docs) {
        Map<String, dynamic> data = userKey.data() as Map<String, dynamic>;
        viewedDishesId = data['dishId'];
      }
    });
    notifyListeners();
  }
}
