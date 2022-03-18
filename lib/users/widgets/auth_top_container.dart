import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/register_screen.dart';
import 'package:xmeal/users/widgets/logo_circle.dart';

class AuthTopContainer extends StatelessWidget {
  const AuthTopContainer(
      {Key? key,
      required this.loginTitleColour,
      required this.signupTitleColour})
      : super(key: key);

  final Color? loginTitleColour;
  final Color? signupTitleColour;

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
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: LogoCircle(
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
