import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/waiter/widgets/drawer.dart';

class WaiterHomeScreen extends StatefulWidget {
  const WaiterHomeScreen({Key? key}) : super(key: key);
  static const id = 'WaiterHomeScreen';
  @override
  State<WaiterHomeScreen> createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
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
            onTap: () => Navigator.pushNamed(context, Login.id),
            child: const Padding(
              padding: EdgeInsets.only(top: 16, right: 15),
              child: Text(
                'Login/Sign-Up',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
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
                      count: '6.9',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    HomeScreenCounters(
                      text: 'Dishes',
                      icon: const Icon(Icons.restaurant, color: appColour),
                      count: '10.9',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    HomeScreenCounters(
                      count: '190',
                      icon: const Icon(Icons.shopping_cart, color: appColour),
                      text: 'Orders',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    HomeScreenCounters(
                      count: '6.9',
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
