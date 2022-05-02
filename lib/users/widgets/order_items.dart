import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class ItemsInOrder extends StatelessWidget {
  ItemsInOrder({
    required this.dishImage,
    required this.dishName,
    required this.dishQuantity,
    required this.dishRegion,
    required this.totalDishPrice,
    Key? key,
  }) : super(key: key);
  String dishImage;
  String dishName;
  String dishRegion;
  int dishQuantity;
  int totalDishPrice;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      height: 72.95,
                      width: 88.35,
                      fit: BoxFit.contain,
                      imageUrl: dishImage,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dishName,
                          style: const TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff0A191E),
                          ),
                        ),
                        Text(
                          dishRegion,
                          style: const TextStyle(
                            fontFamily: 'poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xff0A191E),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30.67,
              width: 83.58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: appColour, style: BorderStyle.solid, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dishQuantity.toString(),
                    style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 21,
                      color: Color(0xffEA6435),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Text(
                totalDishPrice.toString(),
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff050505),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
