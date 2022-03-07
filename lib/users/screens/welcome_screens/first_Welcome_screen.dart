import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/welcome_screens/second_Welcome_screen.dart';
import 'package:xmeal/users/widgets/welcome_screen.dart';

class First_Welcome_Screen extends StatelessWidget {
  static String id = 'first_welcome_screen';

  dynamic image = 'assets/images/first_welcome_image.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(
        skipButton: () =>
            Navigator.pushNamed(context, Second_welcome_screen.id),
        centerText: 'Save Food With our new Feature',
        image: image,
        imageHeight: 350,
        imageWidth: 350,
        screenNo: 1,
      ),
    );
  }
}
