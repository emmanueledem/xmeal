import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/into_screens.dart/first_Welcome_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/logoCircle.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
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
    Navigator.pushNamed(context, first_welcome_screen.id);
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
