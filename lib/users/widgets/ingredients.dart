import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({Key? key, required this.image}) : super(key: key);

  final ImageProvider image;

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
