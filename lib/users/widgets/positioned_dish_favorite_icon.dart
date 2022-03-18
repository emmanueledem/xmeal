import 'package:flutter/material.dart';

class Positionedfavoriteicon extends StatelessWidget {
  const Positionedfavoriteicon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 264,
      width: 38.24,
      right: 33,
      height: 35.01,
      child: Image(image: AssetImage('assets/images/favoriteIcon.png')),
    );
  }
}
