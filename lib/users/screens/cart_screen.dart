import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';

import 'package:xmeal/users/widgets/favorite_dishes.dart';

class cart_screen extends StatelessWidget {
  const cart_screen({Key? key}) : super(key: key);
  static const id = 'view_single_dish';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Your Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 8.0),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, view_single_dish.id);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
