import 'package:flutter/material.dart';
import 'package:xmeal/users/widgets/logo_circle.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoCircle(
            circleHeight: 80,
            circleWidth: 80,
            titlefontSize: 15,
            imageWidth: 53,
            imageheight: 53,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'uh-oh Your older at vada pav station has been cancelled as request. we hope to serve you again today',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '02 NOV',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
