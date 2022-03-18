import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class AccountItems extends StatelessWidget {
  const AccountItems({
    Key? key,
    required this.avatarIcon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final IconData avatarIcon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: appColour,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      avatarIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            InkWell(
              onTap: onPressed,
              child: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
