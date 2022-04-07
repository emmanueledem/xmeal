import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/services/providers/user_auth_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/waiter/screens/home_screen.dart';
import '../../services/providers/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const id = 'LoadingScreen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final _auth = FirebaseAuth.instance;
  String? userTypes;
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        var userVisitingProvider =
            Provider.of<AuthProvider>(context, listen: false);
        userVisitingProvider.changeStatus();
        if (_auth.currentUser != null) {
          var profileProvider =
              Provider.of<ProfileProvider>(context, listen: false);
          await profileProvider.fetchUserData();
          userTypes = profileProvider.userType;
          if (userTypes == 'admin') {
            Navigator.pushReplacementNamed(context, WaiterHomeScreen.id);
          } else {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          }
        } else {
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: appColour,
          size: 50.0,
        ),
      ),
    );
  }
}
