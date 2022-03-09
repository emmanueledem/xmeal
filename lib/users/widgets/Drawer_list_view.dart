import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/drawer_Item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: appColour),
          accountName: Text(
            'Emmanuel',
            style: TextStyle(fontSize: 20.0),
          ),
          accountEmail: Text(
            'Emmanuelokon@gmail.com',
            style: TextStyle(fontSize: 17.0),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/userImage.png'),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        drawerItem(
            icon: const Icon(
              Icons.person,
              size: 25.0,
              color: appColour,
            ),
            title: 'My Profile',
            onpressed: () {}),
        drawerItem(
            icon: const Icon(
              Icons.favorite,
              size: 25.0,
              color: appColour,
            ),
            title: 'My Favorites',
            onpressed: () {}),
        drawerItem(
            icon: const Icon(
              Icons.shopping_cart,
              size: 25.0,
              color: appColour,
            ),
            title: 'My Cart',
            onpressed: () {}),
        drawerItem(
            icon: const Icon(
              Icons.shopping_cart_checkout_outlined,
              size: 25.0,
              color: appColour,
            ),
            title: 'My Orders',
            onpressed: () {}),
      ],
    );
  }
}
