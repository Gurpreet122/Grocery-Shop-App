import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }

  static TextStyle headLineTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }

  static TextStyle lightLineTextFeildStyle() {
    return const TextStyle(
        color: Colors.black38,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins");
  }

  static TextStyle semiboldTextFeildStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }
}
