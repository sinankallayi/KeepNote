import 'package:flutter/material.dart';

const kScreenBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 0, 0, 0),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

const kButtonText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white,
);

const kTextField = BoxDecoration(
  color: Colors.black26,
  borderRadius: BorderRadius.all(
    Radius.circular(
      15,
    ),
  ),
);
