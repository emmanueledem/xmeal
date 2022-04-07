import 'package:flutter/material.dart';

const appColour = Color(0xfffff6838);
const logoContainerColour = Color(0xffFFFFFF);
const authScreensBackgroundColour = Color(0xffBCBABA);

const kinputdecorationStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'poppins',
    fontSize: 15,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
);

const kEditProfileInputDecorationStyle = InputDecoration(
  fillColor: Colors.grey,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: Color.fromARGB(255, 157, 179, 216), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: appColour,
    fontFamily: 'poppins',
    fontSize: 16,
  ),
);

 const defaultImage = 'assets/images/userAvater.png';
// call back url for facebook auth
// https://xmeal-7b662.firebaseapp.com/__/auth/handler

// import 'package:logger/logger.dart';
