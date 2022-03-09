import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/logoCircle.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen(
      {required this.skipButton,
      required this.centerText,
      required this.image,
      required this.imageHeight,
      required this.imageWidth,
      required this.screenNo});
  VoidCallback skipButton;
  String? centerText;
  String image;
  double imageHeight;
  double imageWidth;
  int screenNo;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onTap: skipButton,
                      child: const Text(
                        'SKIP >>',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'poppins',
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              logoCircle(
                circleHeight: 90,
                circleWidth: 90,
                imageWidth: 54,
                imageheight: 54,
                titlefontSize: 16.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                centerText.toString(),
                style: const TextStyle(
                  letterSpacing: -0.03,
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Image(
                  height: imageHeight,
                  width: imageWidth,
                  image: AssetImage(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.circle,
                        color: screenNo == 1 ? Colors.white : Colors.white54,
                        size: 8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.circle,
                        color: screenNo == 2 ? Colors.white : Colors.white54,
                        size: 8,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.circle,
                        color: screenNo == 3 ? Colors.white : Colors.white54,
                        size: 8,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
