import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/dish_list_screen.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/screens/welcome_screens/first_Welcome_Screen.dart';
import 'package:xmeal/users/screens/register_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/second_Welcome_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/splash_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/success_registration_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/third_Welcome_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:xmeal/users/screens/login_screen.dart';

bool kReleaseMode = true;
void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'Xmeal',
      home: const Splash_Screen(),
      routes: {
        First_Welcome_Screen.id: (context) => First_Welcome_Screen(),
        Second_welcome_screen.id: (context) => Second_welcome_screen(),
        Third_welcome_screen.id: (context) => Third_welcome_screen(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        Registration_Success_screen.id: (context) =>
            Registration_Success_screen(),
        Home_Screen.id: (context) => const Home_Screen(),
        Dish_list_screen.id: (context) => const Dish_list_screen(),
        view_single_dish.id: (context) => const view_single_dish(),
      },
    );
  }
}
