import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

networkAlertMessage(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: "Network Error",
    desc: "Connect to a network to continue",
    buttons: [
      DialogButton(
        child: const Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}
