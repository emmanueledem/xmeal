import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

errorAlertMessage(BuildContext context, title, decs, onpressed) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc:  decs,
    buttons: [
      DialogButton(
        child: const Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onpressed,
        width: 120,
      )
    ],
  ).show();
}


logoutAlertMessage(BuildContext context, title, decs, onpressed) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title,
    desc:  decs,
    buttons: [
      DialogButton(
        child: const Text(
          "No",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      ),

      DialogButton(
        child: const Text(
          "Yes",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onpressed,
        width: 120,
      )
    ],
  ).show();
}

 