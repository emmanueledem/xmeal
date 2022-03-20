import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/welcome_screens/success_registration_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import '../widgets/auth_top_container.dart';

class Register extends StatelessWidget {
  static const id = 'Register';
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authScreensBackgroundColour,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const AuthTopContainer(
                    loginTitleColour: Colors.black,
                    signupTitleColour: appColour),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Register',
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: appColour),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Card(
                          margin: EdgeInsets.only(right: 20),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              height: 20,
                              width: 20,
                              image: AssetImage('assets/images/googleLogo.png'),
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              height: 22,
                              width: 22,
                              image:
                                  AssetImage('assets/images/facebookLogo.png'),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Full Name'),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Mobile Number'),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Email Address'),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          obscureText: true,
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Password'),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          obscureText: true,
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Confirm Password'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationSuccessscreen.id);
                            },
                            minWidth: 365,
                            height: 51,
                            textColor: Colors.white,
                            color: appColour,
                            child: const Text(
                              'Sign-Up',
                              style: TextStyle(
                                  color: Color(
                                    0xffF6F6F9,
                                  ),
                                  fontSize: 17,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: const Text(
                          'Already a Member? Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'poppins'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
