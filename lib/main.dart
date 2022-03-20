import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/dish_list_screen.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/screens/notification_screen.dart';
import 'package:xmeal/users/screens/order_details_screen.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/screens/welcome_screens/first_welcome_screen.dart';
import 'package:xmeal/users/screens/register_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/second_welcome_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/splash_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/success_registration_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/third_welcome_screen.dart';
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
      home: const SplashScreen(),
      routes: {
        FirstWelcomeScreen.id: (context) => const FirstWelcomeScreen(),
        SecondWelcomeScreen.id: (context) => const SecondWelcomeScreen(),
        ThirdWelcomeScreen.id: (context) => const ThirdWelcomeScreen(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        RegistrationSuccessscreen.id: (context) =>
            const RegistrationSuccessscreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        DishlistScreen.id: (context) => const DishlistScreen(),
        ViewSingleDish.id: (context) => const ViewSingleDish(),
        OrderDetails.id: (context) => const OrderDetails(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        
      },
    );
  }
}
