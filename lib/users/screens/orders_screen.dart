import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
import 'package:xmeal/users/screens/order_details_screen.dart';
import 'package:xmeal/users/widgets/empty_list_error.dart';
import 'package:xmeal/users/widgets/orders_list.dart';
import 'login_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const OrderScreenContent()
        : Login();
  }
}

class OrderScreenContent extends StatefulWidget {
  const OrderScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderScreenContent> createState() => _OrderScreenContentState();
}

class _OrderScreenContentState extends State<OrderScreenContent> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _handleOrders();
    });
  }

  Future _handleOrders() async {
    await Provider.of<DishOrderProvider>(context, listen: false).fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DishOrderProvider>(
        builder: (context, orders, child) {
          return orders.allOrdersList != null
              ? Padding(
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
                          child: ListView.builder(
                            itemCount: orders.allOrdersList!.length,
                            itemBuilder: (context, index) {
                              final item = orders.allOrdersList![index];
                              return Orderslist(
                                itemPrice: item['totalPrice'],
                                itemQuantity: item['totalItems'],
                                itemRegion: 'Delicious Dishes',
                                orderStatus: item['orderStatus'],
                                orderDate: orders.orderDate.toString(),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderDetails(
                                                orderId: item['orderId'],
                                              )));
                                },
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : orders.hasItemInOrders == true
                  ? EmptyListError(
                      errorText:
                          'When you make order\'s they will appear here.')
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
