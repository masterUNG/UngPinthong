import 'package:flutter/material.dart';

class MyStyle {
  double h1 = 30.0, h2 = 18.0;
  Color textColor = Colors.red[900];
  Color mainColor = Colors.blue[400];
  String nameFont = 'YeonSung';
  String nameApp = 'Ung Pinthong';

  EdgeInsetsGeometry myPadding = EdgeInsets.all(20.0);

  TextStyle myWhiteTextStyle = TextStyle(color: Colors.white);

  TextStyle myTextStyleH2 = TextStyle(
    color: Colors.red[900],
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  ShapeBorder curveButton = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  );

  MyStyle();
}
