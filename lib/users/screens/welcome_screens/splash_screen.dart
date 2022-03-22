import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/loading_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/first_welcome_screen.dart';
import 'package:xmeal/users/screens/network_eror_screen.dart';
import 'package:xmeal/users/services/providers/internet_provider.dart';
import 'package:xmeal/users/services/providers/welcome_screens_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/logo_circle.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';
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
    Future.delayed(const Duration(seconds: 3), () {
      _handleStartup();
    });
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

  void _handleStartup() async {
    var res = await Provider.of<UserVisiting>(context, listen: false)
        .getVisitingFlag();
    if (res == true) {
      var netWorkProvider =
          Provider.of<NetworkInfoImpl>(context, listen: false);
      await netWorkProvider.checkNewtworkStatus();
      if (netWorkProvider.networkStatus == true) {
        Navigator.pushReplacementNamed(context, LoadingScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, NetworkErrorScreen.id);
      }
    } else {
      Navigator.pushReplacementNamed(context, FirstWelcomeScreen.id);
    }
  }
}
