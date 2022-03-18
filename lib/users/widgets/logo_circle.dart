import 'package:xmeal/users/styles/constants.dart';
import 'package:flutter/material.dart';

class LogoCircle extends StatelessWidget {

   const LogoCircle(
      {Key? key, required this.circleHeight,
      required this.circleWidth,
      required this.imageWidth,
      required this.imageheight,
      required this.titlefontSize}) : super(key: key);

 final double circleHeight;
 final double circleWidth;
  final double imageWidth;
 final double imageheight;
 final double titlefontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 1,
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
                fontFamily: 'poppins',
                fontSize: titlefontSize,
                fontWeight: FontWeight.bold,
                color: appColour),
          )
        ],
      ),
    );
  }
}
