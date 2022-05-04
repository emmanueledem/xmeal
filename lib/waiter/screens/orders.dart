import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:xmeal/waiter/screens/order_details.dart';

class WaiterOrdersList extends StatefulWidget {
  const WaiterOrdersList({Key? key}) : super(key: key);
  static const id = 'waiter_order_list';

  @override
  State<WaiterOrdersList> createState() => _WaiterOrdersListState();
}

class _WaiterOrdersListState extends State<WaiterOrdersList> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    _handleAllOrders();
    super.initState();
  }

  Future _handleAllOrders() async {
    await Provider.of<DishOrderProvider>(context, listen: false)
        .handleAllOrders();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var allOrdersData = Provider.of<DishOrderProvider>(context);
    final orderList = _searchText.isEmpty
        ? allOrdersData.allUsersOrderList
        : allOrdersData.allUsersOrderList!
            .where(
              (item) =>
                  item['userName'].contains(_searchText) ||
                  item['tableNo'].contains(_searchText) ||
                  item['orderStatus'].contains(_searchText),
            )
            .toList();

    return Scaffold(
      backgroundColor: appColour,
      body: WillPopScope(
        onWillPop: () async {
          allOrdersData.allUsersOrderList = null;
          return true;
        },
        child: SafeArea(
            child: orderList != null
                ? Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: TextField(
                            controller: _searchController,
                            decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Search all orders',
                              suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                                scrollDirection: Axis.vertical,
                                itemCount: orderList.length,
                                itemBuilder: (context, index) {
                                  final item = orderList[index];

                                  return OrderInformation(
                                    image: item['userImage'],
                                    totalDishes: item['totalItems'],
                                    name: item['userName'],
                                    tableNo: item['tableNo'],
                                    totalPrice: item['totalPrice'],
                                    orderId: item['orderId'],
                                    orderStatus: item['orderStatus'],
                                    dateTimeAgo: item['dateTimeAgo'],
                                  );
                                })),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}

class OrderInformation extends StatelessWidget {
  OrderInformation({
    Key? key,
    required this.image,
    required this.totalDishes,
    required this.name,
    required this.tableNo,
    required this.totalPrice,
    required this.orderId,
    required this.orderStatus,
    required this.dateTimeAgo,
  }) : super(key: key);
  String? image;
  String? name;
  int? totalDishes;
  String? tableNo;
  int? totalPrice;
  String? orderId;
  String? orderStatus;
  String? dateTimeAgo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WaiterOrderDetails(
                        orderId: orderId.toString(),
                      )));
        },
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: image == null
                      ? Image.asset(
                          defaultImage.toString(),
                          fit: BoxFit.cover,
                          width: 95.95,
                          height: 95.95,
                        )
                      : CachedNetworkImage(
                          imageUrl: image.toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toString(),
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      totalDishes! > 1
                          ? totalDishes.toString() + ' Dishes'
                          : totalDishes.toString() + ' Dishe',
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15.6278,
                          color: appColour),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      tableNo.toString(),
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dateTimeAgo!,
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    totalPrice.toString(),
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  orderStatus == 'Pending'
                      ? const CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 5.0,
                        )
                      : orderStatus == 'Completed'
                          ? const CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 5.0,
                            )
                          : orderStatus == 'Processing'
                              ? const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 5.0,
                                )
                              : const CircleAvatar(
                                  radius: 5.0,
                                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
