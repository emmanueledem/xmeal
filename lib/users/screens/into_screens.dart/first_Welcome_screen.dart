import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import '../../widgets/logoCircle.dart';

class first_welcome_screen extends StatelessWidget {
  static String id = 'first_intro_screen';
  const first_welcome_screen({Key? key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20.0,
                        top: 15.0,
                      ),
                      child: GestureDetector(
                        onTap: null,
                        child: const Text(
                          'SKIP >>',
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                logoCircle(
                  circleHeight: 82,
                  circleWidth: 82,
                  imageWidth: 54,
                  imageheight: 54,
                  titlefontSize: 16.0,
                ),
                const SizedBox(
                  height: 90.0,
                ),
                const Text(
                  'Save Food With our new Feature!',
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Image(
                  image: AssetImage('assets/images/first_welcome_image.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
