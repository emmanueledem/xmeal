import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavoriteDishes extends StatelessWidget {
  const FavoriteDishes(
      {Key? key,
      required this.image,
      required this.dateAdded,
      required this.dishName,
      required this.price,
      required this.region})
      : super(key: key);
  final String image;
  final String? dishName;
  final String? dateAdded;
  final String? region;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 294.4,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.grey.shade300,
              width: 1.3,
              style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 50,
              ),
              child: CachedNetworkImage(
                height: 120.0,
                width: 120,
                fit: BoxFit.contain,
                imageUrl: image.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishName.toString(),
                      style: const TextStyle(
                          fontSize: 17.2972,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins',
                          color: Colors.black),
                    ),
                    Text(
                      dateAdded.toString(),
                      style: const TextStyle(
                          fontSize: 15.3056,
                          fontFamily: 'poppins',
                          color: Color(0xff999999)),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      region.toString(),
                      style: const TextStyle(
                          fontSize: 15.3056,
                          fontFamily: 'poppins',
                          color: Color(0xff999999)),
                    ),
                    Text(
                      price.toString(),
                      style: const TextStyle(
                        fontSize: 16.3056,
                        fontFamily: 'poppins',
                        color: Color(0xff079D49),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
