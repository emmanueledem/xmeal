import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/order_details_screen.dart';
import 'package:xmeal/users/widgets/orders_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Orders',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
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
                    Orderslist(
                      itemName: 'Fried Rice',
                      itemPrice: 100,
                      itemQuantity: '2X',
                      itemRegion: 'Nigerian Meal',
                      orderDate: '02 NOV 2019 at 2:16 PM',
                      onPressed: () {
                        Navigator.pushNamed(context, OrderDetails.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
