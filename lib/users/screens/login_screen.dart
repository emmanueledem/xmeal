import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/services/providers/internet_provider.dart';
import 'package:xmeal/users/services/providers/user_auth_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/network_alert.dart';
import '../widgets/auth_top_container.dart';

class Login extends StatelessWidget {
  static const id = 'Login';
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? userNameOrPhone;
  String? password;

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: authScreensBackgroundColour,
      body: ModalProgressHUD(
        inAsyncCall: loginProvider.saving,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const AuthTopContainer(
                    loginTitleColour: appColour,
                    signupTitleColour: Colors.black,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            validator: (value) {
                              return (value == null || value.isEmpty
                                  ? 'username or Mobile Number is required'
                                  : null);
                            },
                            onChanged: (value) {
                              userNameOrPhone = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Email Address'),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            obscureText: loginProvider.obscureTextStatus,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      loginProvider.passwordToggle();
                                    },
                                    icon: const Icon(Icons.remove_red_eye))),
                            validator: (String? value) {
                              return (value == null || value.isEmpty
                                  ? 'Password is required'
                                  : null);
                            },
                            onChanged: (String? value) {
                              password = value;
                            },
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var networkProvider =
                                      Provider.of<NetworkInfoImpl>(context,
                                          listen: false);
                                  await networkProvider.checkNewtworkStatus();

                                  if (networkProvider.networkStatus == true) {
                                    loginProvider.loginUser(
                                        userNameOrPhone, password, context);
                                  } else {
                                    networkAlertMessage(context);
                                  }
                                }
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
      ),
    );
  }
}
