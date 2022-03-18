import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/second_welcome_screen.dart';
import 'package:xmeal/users/widgets/welcome_screen.dart';

class FirstWelcomeScreen extends StatefulWidget {
  static String id = 'first_welcome_screen';

  const FirstWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<FirstWelcomeScreen> createState() => _FirstWelcomeScreenState();
}

class _FirstWelcomeScreenState extends State<FirstWelcomeScreen> {
  final dynamic image = 'assets/images/first_welcome_image.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.pushNamed(context, SecondWelcomeScreen.id);
        },
        child: WelcomeScreen(
          skipButton: () => Navigator.pushNamed(context, HomeScreen.id),
          centerText: 'Save Food With our new Feature',
          image: image,
          imageHeight: 350,
          imageWidth: 350,
          screenNo: 1,
        ),
      ),
    );
  }
}
