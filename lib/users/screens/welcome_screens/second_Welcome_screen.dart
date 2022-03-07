import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/welcome_screens/third_Welcome_screen.dart';

import 'package:xmeal/users/widgets/welcome_screen.dart';

class Second_welcome_screen extends StatelessWidget {
  static String id = 'second_welcome_screen';
  dynamic image = 'assets/images/second_welcome_image.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(
          skipButton: () =>
              Navigator.pushNamed(context, Third_welcome_screen.id),
          centerText:
              'Set preferences from multiple user from different resturants',
          image: image,
          imageHeight: 350,
          imageWidth: 350,
          screenNo: 2),
    );
  }
}
