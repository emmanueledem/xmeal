import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:xmeal/users/screens/into_screens.dart/first_intro_screen.dart';
import 'package:xmeal/users/styles/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Xmeal',
      home: AnimatedSplashScreen(
        duration: 8000,
        splash: null,
        nextScreen: const first_intro(),
      ),
    );
  }
}

class Applogo extends StatelessWidget {
  const Applogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: appColour,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(4, 8), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              color: logoContainerColour,
            ),
            height: 160,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('assets/images/logo.png'),
                ),
                Text(
                  'Xmeal',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: appColour),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
