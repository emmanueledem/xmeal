import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/items_in_order.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  String orderId;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    Logger().d(widget.orderId);
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
                      'Order Details',
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
                    const ItemsInOrder(),
                    const ItemsInOrder(),
                    const ItemsInOrder(),
                    const ItemsInOrder(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Column(
                        children: const [
                          Text(
                            'ORDERED ON',
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '02 NOV 2019 at 2:16 PM',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'poppins',
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Rejected',
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.track_changes,
                                  color: appColour,
                                ),
                                Text(
                                  'Cancel Order >>',
                                  style: TextStyle(
                                      color: appColour,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
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
