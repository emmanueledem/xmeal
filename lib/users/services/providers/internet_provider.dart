import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl extends ChangeNotifier {
  bool? newtworkStatus;

  final InternetConnectionChecker dataConnectionChecker =
        InternetConnectionChecker();

  // @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;

  void checkNewtworkStatus() async {
    newtworkStatus = await isConnected;
    notifyListeners();
  }

  
}
