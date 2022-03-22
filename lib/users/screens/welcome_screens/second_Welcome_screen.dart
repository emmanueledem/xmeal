import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/loading_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/third_welcome_screen.dart';
import 'package:xmeal/users/services/providers/internet_provider.dart';
import 'package:xmeal/users/widgets/network_alert.dart';

import 'package:xmeal/users/widgets/welcome_screen.dart';

class SecondWelcomeScreen extends StatefulWidget {
  static String id = 'second_welcome_screen';

  const SecondWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<SecondWelcomeScreen> createState() => _SecondWelcomeScreenState();
}

class _SecondWelcomeScreenState extends State<SecondWelcomeScreen> {
  final dynamic image = 'assets/images/second_welcome_image.png';

  @override
  Widget build(BuildContext context) {
    var networkProvider = Provider.of<NetworkInfoImpl>(context);
    networkProvider.checkNewtworkStatus();
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.pushNamed(context, ThirdWelcomeScreen.id);
        },
        child: WelcomeScreen(
            skipButton: () {
              networkProvider.checkNewtworkStatus();
              if (networkProvider.newtworkStatus == true) {
                Navigator.pushNamed(context, LoadingScreen.id);
              } else {
                networkAlertMessage(context);
              }
            },
            centerText:
                'Set preferences from multiple user from different resturants',
            image: image,
            imageHeight: 350,
            imageWidth: 350,
            screenNo: 2),
      ),
    );
  }
}
