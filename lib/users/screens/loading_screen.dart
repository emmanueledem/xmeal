import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/screens/home_screen.dart';
import 'package:xmeal/services/providers/user_auth_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/waiter/screens/home_screen.dart';
import '../../services/providers/user_profile_provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const id = 'LoadingScreen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        var userVisitingProvider =
            Provider.of<AuthProvider>(context, listen: false);
        userVisitingProvider.changeStatus();
        await Provider.of<ProfileProvider>(context, listen: false)
            .fetchUserData();
      },
    );

    Future.delayed(
      const Duration(seconds: 3),
      () {
        clearLoader();
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

  void clearLoader() async {
    var profileInfo = Provider.of<ProfileProvider>(context, listen: false);
    if (profileInfo.userType == 'admin') {
      Navigator.pushReplacementNamed(context, WaiterHomeScreen.id);
    } else if (profileInfo.userType == 'user') {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }
  }
}
