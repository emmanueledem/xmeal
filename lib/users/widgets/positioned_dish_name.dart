import 'package:flutter/material.dart';

class PositionedDishName extends StatelessWidget {
  const PositionedDishName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 265,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0XFF000000).withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 23, right: 23, top: 4, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jollof Rice',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'Suhani’s Stop, Kukatpally',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff616161),
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
