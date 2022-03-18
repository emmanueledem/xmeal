import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/notification_screen.dart';
import 'package:xmeal/users/widgets/account_items.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              const Image(
                height: 72.95,
                width: 88.35,
                image: AssetImage('assets/images/Rectangle 308.png'),
              ),
              const Text(
                'Sangvaleap',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'poppins',
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'I love to taste food',
                style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.edit,
                title: 'Edit Profile',
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.notifications,
                title: 'Notifications',
                onPressed: () {
                  Navigator.pushNamed(context, NotificationScreen.id);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.star,
                title: 'Rate App',
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.auto_awesome,
                title: 'Offers',
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.person,
                title: 'About Us',
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              AccountItems(
                avatarIcon: Icons.login_rounded,
                title: 'Log Out',
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
