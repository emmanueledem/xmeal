import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/welcome_screens/first_Welcome_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/logoCircle.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({
    Key? key,
  }) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        clearSplash();
      },
    );
  }

  void clearSplash() {
    Navigator.pushReplacementNamed(context, First_Welcome_Screen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appColour,
        child: Center(
          child: logoCircle(
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
}
