import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class ViewedDishes extends StatelessWidget {
  ViewedDishes(
      {Key? key,
      required this.image,
      required this.dishName,
      required this.price,
      required this.region})
      : super(key: key);
  ImageProvider image;
  String? dishName;
  String? dateAdded;
  String? region;
  String? price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.99),
      child: Container(
        width: 196.92,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.grey.shade300,
              width: 1.3,
              style: BorderStyle.solid),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image(
                height: 120.0,
                width: 120,
                fit: BoxFit.contain,
                image: image,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              dishName.toString(),
              style: const TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
            Text(
              region.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'poppins',
                  color: Color(0xff999999)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              price.toString(),
              style: const TextStyle(
                  fontFamily: 'poppins', fontSize: 18.6278, color: appColour),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
