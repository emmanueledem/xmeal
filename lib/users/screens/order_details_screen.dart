import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/order_items.dart';

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
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _handleOderData();
    });
  }

  _handleOderData() async {
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    await Provider.of<DishOrderProvider>(context, listen: false)
        .handleOrderDetails(widget.orderId);
    //     Logger().d(widget.orderId);
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // _handleOderData();
    return Scaffold(
      backgroundColor: appColour,
      body: Consumer<DishOrderProvider>(
        builder: (context, orderDetails, child) {
          return SafeArea(
            child: orderDetails.orderDetailsList == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: orderDetails.orderDetailsList!.length,
                            itemBuilder: (context, index) {
                              final Map items =
                                  orderDetails.orderDetailsList![index];
                              return ItemsInOrder(
                                dishImage: items['dishImage'],
                                dishName: items['dishName'],
                                dishQuantity: items['itemQuantity'],
                                dishRegion: items['dishRegion'],
                                totalDishPrice: items['totalItemPrice'],
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'ORDERED ON',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              orderDetails.dateOfOrderedItems.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                                  orderDetails.totalOfOrderedItems.toString(),
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Rejected',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.track_changes,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Cancel Order >>',
                                    style: TextStyle(
                                        color: Colors.white,
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
          );
        },
      ),
    );
  }
}
