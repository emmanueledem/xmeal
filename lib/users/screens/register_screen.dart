import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/services/providers/user_auth_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/network_alert.dart';
import '../widgets/auth_top_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatelessWidget {
  static const id = 'Register';
  Register({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? fullName;
  String? mobileNumber;
  String? emailAddress;
  String? password;
  String userType = 'user';

  @override
  Widget build(BuildContext context) {
    var registrationProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: authScreensBackgroundColour,
      body: ModalProgressHUD(
        inAsyncCall: registrationProvider.saving,
        child: SafeArea(
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
                                image:
                                    AssetImage('assets/images/googleLogo.png'),
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
                                image: AssetImage(
                                    'assets/images/facebookLogo.png'),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Full Name'),
                            validator: (String? value) {
                              return (value == null || value.isEmpty)
                                  ? 'FullName is required'
                                  : null;
                            },
                            onChanged: (String? value) {
                              fullName = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Mobile Number'),
                            validator: (String? value) {
                              return (value == null || value.isEmpty
                                  ? 'MobileNumber is required'
                                  : null);
                            },
                            onChanged: (String? value) {
                              mobileNumber = value.toString();
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Email Address'),
                            validator: (String? value) {
                              return (value != '' &&
                                      EmailValidator.validate(value!)
                                  ? null
                                  : 'Please enter a valid email');
                            },
                            onChanged: (String value) {
                              emailAddress = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            obscureText: registrationProvider.obscureTextStatus,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      registrationProvider.passwordToggle();
                                    },
                                    icon: const Icon(Icons.remove_red_eye))),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password Length is too short';
                              } else if (value != '' && value.length < 6) {
                                return 'Password Length is too short';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (String? value) {
                              password = value;
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: kinputdecorationStyle.copyWith(
                                hintText: 'Confirm Password'),
                            validator: (String? value) {
                              return (value != password || value!.isEmpty)
                                  ? 'Both passwords do not match'
                                  : null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
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
                                    registrationProvider.createUser(
                                        fullName,
                                        emailAddress,
                                        mobileNumber,
                                        userType,
                                        password,
                                        context);
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
      ),
    );
  }
}
