import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/register_screen.dart';
import 'package:xmeal/users/widgets/logoCircle.dart';

class authTopContainer extends StatelessWidget {
  authTopContainer(
      {required this.loginTitleColour, required this.signupTitleColour});

  Color? loginTitleColour;
  Color? signupTitleColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: logoCircle(
              imageWidth: 125,
              imageheight: 125,
              circleHeight: 190,
              circleWidth: 190,
              titlefontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: loginTitleColour,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Register.id);
                  },
                  child: Text(
                    'Sign-up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: signupTitleColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
