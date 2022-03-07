import 'package:flutter/material.dart';

const appColour = Color(0xffFFF6838);
const logoContainerColour = Color(0xffFFFFFF);
const authScreensBackgroundColour = Color(0xffBCBABA);

const KinputdecorationStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'poppins',
    fontSize: 20,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);
