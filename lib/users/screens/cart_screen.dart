import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/cart_list.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const CartScreenContent()
        : Login();
  }
}

class CartScreenContent extends StatelessWidget {
  const CartScreenContent({
    Key? key,
  }) : super(key: key);

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
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Cartlist(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 30),
                      child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x14000000),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: Offset(
                                  0,
                                  2,
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 21, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff0A191E),
                                  ),
                                ),
                                Text(
                                  '₹420',
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xff0A191E),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50.6,
                            width: 220.93,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              color: appColour,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 38),
                              child: Text(
                                'Place Order >>',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
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
