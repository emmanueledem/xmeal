import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/welcome_screens/splash_screen.dart';
import 'package:xmeal/users/styles/constants.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({Key? key}) : super(key: key);
  static const id = 'NetworkErrorScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const Text(
                  'Newtwork Error...Connect to a network to continue',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20.0,
                      letterSpacing: -0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, SplashScreen.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(365, 51),
                    ),
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                  ),
                  icon: const Icon(
                    Icons.accessible_forward,
                    size: 24,
                    color: appColour,
                  ),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(
                      color: appColour,
                      fontSize: 17,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
