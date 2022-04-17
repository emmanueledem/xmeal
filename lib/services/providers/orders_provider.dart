import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DishOrderProvider extends ChangeNotifier {
  CollectionReference cart = FirebaseFirestore.instance.collection("cart");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool? isAddedToCart;
  String? updateResponse;
  String? cartDishId;
  List<Map<String, dynamic>>? cartDishList;
  bool hasItemInCart = false;
  bool inAsyncCall = false;
  CollectionReference dishes = FirebaseFirestore.instance.collection('dishes');

  void manageProgress(value) {
    inAsyncCall = value;
    notifyListeners();
  }

  Future<void> checkIfInCart(dishId) async {
    String? userId;
    userId = _auth.currentUser!.uid;
    var res = await cart
        .where('dishId', isEqualTo: dishId)
        .where('viewedBy', isEqualTo: userId)
        .get();
    if (res.docs.isNotEmpty) {
      isAddedToCart = true;
    } else if (res.docs.isEmpty) {
      isAddedToCart = false;
    }
    notifyListeners();
  }

  Future addToCart(dishId, itemCount) async {
    manageProgress(true);
    String? userId;
    userId = _auth.currentUser!.uid;
    await cart
        .where('addedBy', isEqualTo: userId)
        .where('dishId', isEqualTo: dishId)
        .get()
        .then((value) async {
      if (value.docs.isEmpty) {
        var data = {
          'itemCount': itemCount,
          'dishId': dishId,
          'addedBy': userId,
          'dateAdded': DateTime.now(),
        };
        await cart.doc().set(data);
        isAddedToCart = true;
        manageProgress(false);
        updateResponse = 'Dish added to cart Sucessfully';
      } else {
        for (var element in value.docs) {
          if (value.docs.isNotEmpty) {
            await cart.doc(element.id).delete();
            isAddedToCart = false;
            manageProgress(false);
            updateResponse = 'Dish Removed from cart Sucessfully';
          }
        }
      }
    });
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>>? fetchCartItem() async {
    String userId;
    userId = _auth.currentUser!.uid;
    List<Map<String, dynamic>>? listData = [];

    await cart.where('addedBy', isEqualTo: userId).get().then((value) async {
      if (value.docs.isEmpty) {
        hasItemInCart = true;
      } else {
        hasItemInCart = false;
      }
      for (var res in value.docs) {
        Map<String, dynamic> data = res.data() as Map<String, dynamic>;
        cartDishId = data['dishId'];
        await dishes.doc(cartDishId).get().then((value) {
          Map<String, dynamic> dishData = value.data() as Map<String, dynamic>;

          dishData['id'] = value.id;
          listData.add(dishData);
          cartDishList = listData;
        });
      }
    });
    notifyListeners();
    return listData;
  }
}