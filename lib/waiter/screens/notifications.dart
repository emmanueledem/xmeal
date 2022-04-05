import 'package:flutter/material.dart';
import 'package:xmeal/users/widgets/notification_list.dart';

class WaiterNotificationScreen extends StatelessWidget {
  static String id = 'waiterNotification';

  const WaiterNotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notification',
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
                    children: const [
                      NotificationList(),
                      NotificationList(),
                      NotificationList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
