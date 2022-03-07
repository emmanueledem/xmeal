import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import '../widgets/authTopContainer.dart';

class Register extends StatelessWidget {
  static const id = 'Register';
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authScreensBackgroundColour,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              authTopContainer(
                  loginTitleColour: Colors.black, signupTitleColour: appColour),
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
                        fontSize: 36,
                        color: appColour),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Card(
                        margin: EdgeInsets.only(right: 20),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Image(
                            height: 27,
                            width: 27,
                            image: AssetImage('assets/images/googleLogo.png'),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Image(
                            height: 27,
                            width: 27,
                            image: AssetImage('assets/images/googleLogo.png'),
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
                        decoration: KinputdecorationStyle.copyWith(
                            hintText: 'Full Name'),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: KinputdecorationStyle.copyWith(
                            hintText: 'Mobile Number'),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: KinputdecorationStyle.copyWith(
                            hintText: 'Password'),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: KinputdecorationStyle.copyWith(
                            hintText: 'Confirm Password'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 380,
                        height: 51,
                        textColor: Colors.white,
                        color: appColour,
                        child: const Text(
                          'Sign-Up',
                          style: TextStyle(
                              color: Color(
                                0xffF6F6F9,
                              ),
                              fontSize: 18,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w600),
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
                            fontSize: 20,
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
    );
  }
}
