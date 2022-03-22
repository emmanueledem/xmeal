import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/loading_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/second_welcome_screen.dart';
import 'package:xmeal/users/services/providers/internet_provider.dart';
import 'package:xmeal/users/widgets/network_alert.dart';
import 'package:xmeal/users/widgets/welcome_screen.dart';

class FirstWelcomeScreen extends StatelessWidget {
  static String id = 'first_welcome_screen';
  final dynamic image = 'assets/images/first_welcome_image.png';

  const FirstWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var networkProvider = Provider.of<NetworkInfoImpl>(context);
    networkProvider.checkNewtworkStatus();

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (details) {
          Navigator.pushNamed(context, SecondWelcomeScreen.id);
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
