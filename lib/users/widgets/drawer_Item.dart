import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
class drawerItem extends StatelessWidget {
  drawerItem(
      {required this.icon, required this.onpressed, required this.title});
  Icon? icon;
  String? title;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onpressed,
        child: ListTile(
          iconColor: Colors.brown,
          leading: icon,
          title: Text(
            title.toString(),
            style: const TextStyle(fontSize: 18.0, color: appColour),
          ),
        ),
      ),
    );
  }
}
