import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/welcome_screens/first_welcome_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/logo_circle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 6),
      () {
        shiftScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appColour,
        child: const Center(
          child: LogoCircle(
            imageWidth: 100,
            imageheight: 100,
            circleHeight: 160,
            circleWidth: 160,
            titlefontSize: 20.0,
          ),
        ),
      ),
    );
  }

  void shiftScreen() {
    Navigator.pushReplacementNamed(context, FirstWelcomeScreen.id);
  }
}
