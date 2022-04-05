import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl extends ChangeNotifier {
  bool? networkStatus;

  final InternetConnectionChecker dataConnectionChecker =
      InternetConnectionChecker();

  // @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;

  Future<void> checkNewtworkStatus() async {
    networkStatus = await isConnected;
    notifyListeners();
  }
}
