import 'package:flutter/material.dart';
import 'package:xmeal/services/providers/orders_provider.dart';
import 'package:xmeal/users/screens/dish_list_screen.dart';
import 'package:xmeal/users/screens/edit_profile.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/screens/loading_screen.dart';
import 'package:xmeal/users/screens/notification_screen.dart';
import 'package:xmeal/users/screens/order_details_screen.dart';
import 'package:xmeal/users/screens/qr_sacanner_create.dart';
import 'package:xmeal/users/screens/welcome_screens/first_welcome_screen.dart';
import 'package:xmeal/users/screens/register_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/second_welcome_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/splash_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/success_registration_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/third_welcome_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/dishes_provider.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/services/providers/user_profile_provider.dart';
import 'package:xmeal/services/providers/user_auth_provider.dart';
import 'package:xmeal/waiter/screens/all_dishes.dart';
import 'package:xmeal/waiter/screens/all_users.dart';
import 'package:xmeal/waiter/screens/home_screen.dart';
import 'package:xmeal/waiter/screens/notifications.dart';
import 'users/screens/network_eror_screen.dart';
import 'waiter/screens/add_dish_.dart';

bool kReleaseMode = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NetworkInfoImpl(),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DishesProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => DishOrderProvider()),
      ],
      child: MaterialApp(
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
          SplashScreen.id: (context) => const SplashScreen(),
          FirstWelcomeScreen.id: (context) => const FirstWelcomeScreen(),
          SecondWelcomeScreen.id: (context) => const SecondWelcomeScreen(),
          ThirdWelcomeScreen.id: (context) => const ThirdWelcomeScreen(),
          Login.id: (context) => Login(),
          Register.id: (context) => Register(),
          RegistrationSuccessscreen.id: (context) =>
              RegistrationSuccessscreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          DishlistScreen.id: (context) => const DishlistScreen(),
          OrderDetails.id: (context) => const OrderDetails(),
          NotificationScreen.id: (context) => const NotificationScreen(),
          LoadingScreen.id: (context) => const LoadingScreen(),
          NetworkErrorScreen.id: (context) => const NetworkErrorScreen(),
          EditProfileScreen.id: (context) => const EditProfileScreen(),
          WaiterHomeScreen.id: (context) => const WaiterHomeScreen(),
          WaiterNotificationScreen.id: (context) =>
              const WaiterNotificationScreen(),
          WaiterDishlistScreen.id: (context) => const WaiterDishlistScreen(),
          WaiterAddDishScreen.id: (context) => const WaiterAddDishScreen(),
          AllUsersList.id: (context) => AllUsersList(),
          QrScanner.id: (context) => const QrScanner(),
        },
      ),
    );
  }
}
