import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
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

class CartScreenContent extends StatefulWidget {
  const CartScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreenContent> createState() => _CartScreenContentState();
}

class _CartScreenContentState extends State<CartScreenContent> {
  @override
  void initState() {
    super.initState();
    _handleCartItems();
  }

  Future _handleCartItems() async {
    await Provider.of<DishOrderProvider>(context, listen: false)
        .fetchCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Consumer<DishOrderProvider>(
          builder: (context, cartItem, child) {
            return Column(
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListView.builder(
                      itemCount: cartItem.cartDishList!.length,
                      itemBuilder: (context, index) {
                        return Cartlist();
                      },
                      scrollDirection: Axis.vertical,
                      // SizedBox(
                      //     height: 8.0,
                      //   ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                            horizontal: 21, vertical: 5),
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
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35),
                          child: Text(
                            'Place Order >>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: appColour,
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
            );
          },
        ),
      ),
    );
  }
}
