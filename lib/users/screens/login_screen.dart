import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import '../widgets/auth_top_container.dart';

class Login extends StatelessWidget {
  static const id = 'Login';
  const Login({Key? key}) : super(key: key);

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
                  loginTitleColour: appColour,
                  signupTitleColour: Colors.black,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          decoration: kinputdecorationStyle.copyWith(
                              hintText: 'Username, Mobile Number'),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'poppins',
                            fontSize: 14,
                            color: appColour,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, HomeScreen.id);
                            },
                            minWidth: 365,
                            height: 51,
                            textColor: Colors.white,
                            color: appColour,
                            child: const Text(
                              'Login',
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
                      const Center(
                        child: Text(
                          'Or',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'poppins'),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff1877F2),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              const Size(365, 51),
                            ),
                            shape: MaterialStateProperty.all(
                                const StadiumBorder()),
                          ),
                          icon: const Icon(
                            Icons.facebook,
                            size: 24,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Log in with Facebook',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: MaterialButton(
                              onPressed: () {},
                              minWidth: 100,
                              height: 51,
                              textColor: Colors.white,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                      'assets/images/googleLogo.png',
                                    ),
                                    height: 24,
                                    width: 24,
                                  ),
                                  Text(
                                    'Log In with Google',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.54),
                                        fontSize: 17,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
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
