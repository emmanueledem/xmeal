import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/waiter/screens/notifications.dart';
import 'package:xmeal/waiter/widgets/drawer.dart';

class WaiterHomeScreen extends StatefulWidget {
  const WaiterHomeScreen({Key? key}) : super(key: key);
  static const id = 'WaiterHomeScreen';
  @override
  State<WaiterHomeScreen> createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _handleCounter();
    });
    super.initState();
  }

  int userCount = 0;
  int dishCount = 0;
  int allOrdersCount = 0;
  int activeOrdersCount = 0;

  Future<void> _handleCounter() async {
    userCount = await countUsers();
    dishCount = await countDishes();
    allOrdersCount = await countAllOrders();
    activeOrdersCount = await countActiveOrders();
    setState(() {});
  }

  final firestore = FirebaseFirestore.instance;
  Future<int> countUsers() async {
    var totalCount = 0;
    await firestore
        .collection("users")
        .where('userType', isEqualTo: 'user')
        .get()
        .then((querySnapshot) {
      totalCount = querySnapshot.size;
    });
    return totalCount;
  }

  Future<int> countDishes() async {
    var totalCount = 0;
    await firestore.collection("dishes").get().then((querySnapshot) {
      totalCount = querySnapshot.size;
    });
    return totalCount;
  }

  Future<int> countAllOrders() async {
    var totalCount = 0;
    await firestore.collection("orders").get().then((querySnapshot) {
      totalCount = querySnapshot.size;
    });
    return totalCount;
  }

  Future<int> countActiveOrders() async {
    var totalCount = 0;
    await firestore
        .collection("orders")
        .where('orderStatus', whereNotIn: ['canceled', 'completed'])
        .get()
        .then((querySnapshot) {
          querySnapshot.docs.length;
          totalCount = querySnapshot.size;
        });
    return totalCount;
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 3), () async {
      await _handleCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: appColour, size: 28),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Xmeal',
          style: TextStyle(
            color: appColour,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'poppins',
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, WaiterNotificationScreen.id),
            child: const Padding(
              padding: EdgeInsets.only(top: 5, right: 15),
              child: Icon(
                Icons.notifications,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        color: appColour,
        backgroundColor: Colors.white,
        strokeWidth: 3,
        displacement: 100,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      HomeScreenCounters(
                        text: 'User',
                        icon: const Icon(
                          Icons.person,
                          color: appColour,
                        ),
                        count: userCount.toString(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      HomeScreenCounters(
                        text: 'Dishes',
                        icon: const Icon(Icons.restaurant, color: appColour),
                        count: dishCount.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      HomeScreenCounters(
                        count: allOrdersCount.toString(),
                        icon: const Icon(Icons.shopping_cart, color: appColour),
                        text: 'Orders',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      HomeScreenCounters(
                        count: activeOrdersCount.toString(),
                        icon: const Icon(
                          Icons.shopping_cart_checkout,
                          color: appColour,
                        ),
                        text: 'Active Orders',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenCounters extends StatelessWidget {
  HomeScreenCounters(
      {Key? key, required this.count, required this.icon, required this.text})
      : super(key: key);
  String count;
  Icon icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
              color: appColour,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 8.0, top: 30.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundColor: Colors.white, child: icon),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  count,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.0),
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontFamily: 'poppins',
                      color: Colors.white,
                      fontSize: 17.0),
                ),
              ],
            ),
          )),
    );
  }
}
