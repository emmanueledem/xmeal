import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/services/providers/user_auth_provider.dart';
import 'package:xmeal/services/providers/user_profile_provider.dart';
import 'package:xmeal/users/screens/notification_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/alert_boxes.dart';
import 'package:xmeal/users/widgets/network_alert.dart';
import 'package:xmeal/waiter/screens/add_dish_.dart';
import 'package:xmeal/waiter/screens/all_dishes.dart';
import 'package:xmeal/waiter/screens/all_users.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: appColour,
        child: Consumer<ProfileProvider>(builder: ((context, profile, child) {
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  accountName: Text(
                    profile.fullName.toString(),
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'poppins',
                        color: Colors.black),
                  ),
                  accountEmail: Text(
                    profile.email.toString(),
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'poppins',
                        color: Colors.black),
                  ),
                  // AssetImage('assets/images/tamc.jpg');
                  currentAccountPicture: ClipOval(
                    child: profile.imageUrl == null
                        ? Image.asset(
                            defaultImage.toString(),
                            fit: BoxFit.cover,
                            width: 95.95,
                            height: 95.95,
                          )
                        : CachedNetworkImage(
                            imageUrl: profile.imageUrl.toString(),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                  )),
              DrawerList(
                text: 'All Dishes',
                icon: const Icon(
                  Icons.restaurant,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, WaiterDishlistScreen.id);
                },
              ),
              DrawerList(
                text: 'Add Dishes',
                icon: const Icon(
                  Icons.food_bank_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, WaiterAddDishScreen.id);
                },
              ),
              DrawerList(
                text: 'All Orders',
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '');
                },
              ),
              DrawerList(
                text: 'Active Orders',
                icon: const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '');
                },
              ),
              DrawerList(
                text: 'Users',
                icon: const Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, AllUsersList.id);
                },
              ),
              DrawerList(
                text: 'Notifications',
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, NotificationScreen.id);
                },
              ),
              DrawerList(
                text: 'Log-Out',
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  logoutAlertMessage(
                      context, '', 'Are You Sure you want to logout', () async {
                    var networkProvider =
                        Provider.of<NetworkInfoImpl>(context, listen: false);
                    await networkProvider.checkNewtworkStatus();
                    if (networkProvider.networkStatus == true) {
                      var signoutProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      signoutProvider.signoutUser(context);
                    } else {
                      networkAlertMessage(context);
                    }
                  });
                },
              ),
            ],
          );
        })));
  }
}

// ignore: must_be_immutable
class DrawerList extends StatelessWidget {
  DrawerList(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);
  Icon? icon;
  String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          iconColor: Colors.brown,
          trailing: icon,
          title: Text(
            text.toString(),
            style: const TextStyle(
                fontSize: 18.0, fontFamily: 'poppins', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
