import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/qr_sacanner_scan.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/alert_boxes.dart';
import 'package:xmeal/users/widgets/empty_list_error.dart';
import 'package:xmeal/users/widgets/network_alert.dart';

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
            return ModalProgressHUD(
              inAsyncCall: cartItem.inAsyncCall,
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
                  cartItem.cartDishList != null &&
                          cartItem.cartDishList!.isNotEmpty
                      ? Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: cartItem.cartDishList!.length,
                              itemBuilder: (context, index) {
                                final Map item = cartItem.cartDishList![index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      item['favorite'] == true
                                          ? const Icon(
                                              Icons.favorite,
                                              color: appColour,
                                              size: 17,
                                            )
                                          : const Text(''),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewSingleDish(
                                                              productId:
                                                                  item["id"],
                                                              dishViews: item[
                                                                  'dishViews'],
                                                              dishImage: item[
                                                                  'dishImage'],
                                                              dishName: item[
                                                                  'dishName'],
                                                              dishDescription: item[
                                                                  'dishdescription'],
                                                              dishPrice: item[
                                                                  'dishprice'],
                                                              dishRegion: item[
                                                                  'dishRegion'],
                                                            )));
                                              },
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: CachedNetworkImage(
                                                      height: 72.95,
                                                      width: 88.35,
                                                      fit: BoxFit.contain,
                                                      imageUrl:
                                                          item['dishImage'],
                                                      progressIndicatorBuilder: (context,
                                                              url,
                                                              downloadProgress) =>
                                                          CircularProgressIndicator(
                                                              value:
                                                                  downloadProgress
                                                                      .progress),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          item['dishName'],
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff0A191E),
                                                          ),
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                        Text(
                                                          item['dishRegion'],
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'poppins',
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff0A191E),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30.67,
                                            width: 83.58,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: appColour,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    var networkProvider =
                                                        Provider.of<
                                                                NetworkInfoImpl>(
                                                            context,
                                                            listen: false);
                                                    await networkProvider
                                                        .checkNewtworkStatus();
                                                    if (networkProvider
                                                            .networkStatus ==
                                                        true) {
                                                      await cartItem
                                                          .handleItemQuantity(
                                                              item[
                                                                  'cartDocsId'],
                                                              item['quantity'],
                                                              'subtract');
                                                      await _handleCartItems();
                                                      setState(() {});
                                                    } else {
                                                      networkAlertMessage(
                                                          context);
                                                    }
                                                  },
                                                  child: const Text(
                                                    '-',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 21,
                                                      color: Color(0xffEA6435),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  item['quantity'].toString(),
                                                  style: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 21,
                                                    color: Color(0xffEA6435),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    var networkProvider =
                                                        Provider.of<
                                                                NetworkInfoImpl>(
                                                            context,
                                                            listen: false);
                                                    await networkProvider
                                                        .checkNewtworkStatus();
                                                    if (networkProvider
                                                            .networkStatus ==
                                                        true) {
                                                      await cartItem
                                                          .handleItemQuantity(
                                                              item[
                                                                  'cartDocsId'],
                                                              item['quantity'],
                                                              'add');
                                                      await _handleCartItems();
                                                      setState(() {});
                                                    } else {
                                                      networkAlertMessage(
                                                          context);
                                                    }
                                                  },
                                                  child: const Text(
                                                    '+',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 21,
                                                      color: Color(0xffEA6435),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Text(
                                              item['itemPrice'].toString(),
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff050505),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Consumer<DishOrderProvider>(
                                        builder: (context, dishOrder, child) {
                                          return GestureDetector(
                                              onTap: () {
                                                removefromCart(context, '',
                                                    'Are You Sure you want to Remove item from cart',
                                                    () async {
                                                  var networkProvider = Provider
                                                      .of<NetworkInfoImpl>(
                                                          context,
                                                          listen: false);
                                                  await networkProvider
                                                      .checkNewtworkStatus();
                                                  if (networkProvider
                                                          .networkStatus ==
                                                      true) {
                                                    Navigator.pop(context);
                                                    await Provider.of<
                                                                DishOrderProvider>(
                                                            context,
                                                            listen: false)
                                                        .removeItemFromCart(
                                                            item['cartDocsId'],
                                                            item['orderId']);
                                                    await _handleCartItems();
                                                    setState(() {});
                                                  } else {
                                                    networkAlertMessage(
                                                        context);
                                                  }
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_rounded,
                                                color: appColour,
                                              ));
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade300,
                                          height: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : cartItem.hasItemInCart == true
                          ? EmptyListError(
                              errorText:
                                  'When you add dishe\'s to cart they will appear here.')
                          : const Center(child: CircularProgressIndicator()),
                  cartItem.cartDishList != null &&
                          cartItem.cartDishList!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
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
                                      cartItem.totalOfAllItems.toString(),
                                      style: const TextStyle(
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
                        )
                      : const Text(''),
                  cartItem.cartDishList != null &&
                          cartItem.cartDishList!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, QrScanner.id);
                                },
                                child: Container(
                                  height: 50.6,
                                  width: 220.93,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
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
                              ),
                            ],
                          ),
                        )
                      : const Text(''),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
