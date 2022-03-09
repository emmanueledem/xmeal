import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';

import '../../widgets/logoCircle.dart';

class Registration_Success_screen extends StatelessWidget {
  static String id = 'Registration_Success_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                logoCircle(
                  circleHeight: 82,
                  circleWidth: 82,
                  imageWidth: 54,
                  imageheight: 54,
                  titlefontSize: 16.0,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'Welcome Sumanya',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30.0,
                      letterSpacing: -0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  '  Unlock the world of regular and rescued food by loging in to your account.',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20.0,
                      letterSpacing: -0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 150.0,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    minimumSize: MaterialStateProperty.all(
                      const Size(365, 51),
                    ),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                  icon: const Icon(
                    Icons.login,
                    size: 24,
                    color: appColour,
                  ),
                  label: const Text(
                    'Continue to Log In',
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
