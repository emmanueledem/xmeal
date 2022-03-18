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
  final ImageProvider image;
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
              child: Image(
                image: image,
                height: 74,
                width: 74,
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
                    const SizedBox(
                      height: 10,
                    ),
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
