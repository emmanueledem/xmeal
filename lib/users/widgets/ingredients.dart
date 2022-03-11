import 'package:flutter/material.dart';

class ingredients extends StatelessWidget {
  ingredients({required this.image});

  ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image(
        width: 61.48,
        height: 43.78,
        image: image,
      ),
    );
  }
}
