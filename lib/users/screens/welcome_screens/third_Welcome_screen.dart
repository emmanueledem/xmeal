import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';

import '../../widgets/logoCircle.dart';

class Third_welcome_screen extends StatelessWidget {
  static String id = 'Third_welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: appColour,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
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
                  'Fast rescued food at your service',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 50.0,
                      letterSpacing: -0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const Expanded(
                  child: Image(
                    height: 300,
                    width: 300,
                    image: AssetImage('assets/images/third_welcome_image.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    child: Container(
                      width: 314,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              color: Color(0xffFF460A),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
