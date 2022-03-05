import 'package:xmeal/users/styles/constants.dart';
import 'package:flutter/material.dart';

class logoCircle extends StatelessWidget {
  logoCircle(
      {required this.circleHeight,
      required this.circleWidth,
      required this.imageWidth,
      required this.imageheight,
      required this.titlefontSize});

  double circleHeight;
  double circleWidth;
  double imageWidth;
  double imageheight;
  double titlefontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(4, 8), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(100),
        color: logoContainerColour,
      ),
      height: circleHeight,
      width: circleWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: imageheight,
            width: imageWidth,
            image: const AssetImage('assets/images/logo.png'),
          ),
          Text(
            'Xmeal',
            style: TextStyle(
                fontSize: titlefontSize,
                fontWeight: FontWeight.bold,
                color: appColour),
          )
        ],
      ),
    );
  }
}
