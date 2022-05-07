import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class Orderslist extends StatelessWidget {
  const Orderslist({
    Key? key,
    required this.itemPrice,
    required this.itemQuantity,
    required this.itemRegion,
    required this.orderDate,
    required this.onPressed,
    required this.orderStatus,
  }) : super(key: key);
  final int itemPrice;
  final int itemQuantity;
  final String itemRegion;
  final String orderDate;
  final String orderStatus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(
                0,
                1,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(
                        width: 88.35,
                        height: 72.95,
                        image: AssetImage(
                          'assets/images/Rectangle 308.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Xmeal',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              itemRegion,
                              style: const TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    itemPrice.toString(),
                    style: const TextStyle(
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
              height: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dishes',
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        itemQuantity == 1
                            ? itemQuantity.toString() + ' Dish'
                            : itemQuantity.toString() + ' Dishes',
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'ORDERED ON',
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        orderDate,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 2,
              height: 2,
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderStatus,
                    style: const TextStyle(
                        color: Color(0xff999999),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: onPressed,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.track_changes,
                          color: appColour,
                        ),
                        Text(
                          'Track Order >>',
                          style: TextStyle(
                              color: appColour,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
