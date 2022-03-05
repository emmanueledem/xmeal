import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/into_screens.dart/first_Welcome_screen.dart';
import 'package:xmeal/users/screens/into_screens.dart/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Xmeal',
      home: splashScreen(),
      routes: {
        first_welcome_screen.id: (context) => first_welcome_screen(),
      },
    );
  }
}
