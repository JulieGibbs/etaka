import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: non_constant_identifier_names
void error_toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 7,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 15.0);
}

void success_toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 7,
      backgroundColor: Color(0xff00e676),
      textColor: Colors.white,
      fontSize: 15.0);
}

String removeBrackets(text) {
  return text.toString().replaceAll("[", "").replaceAll("]", "");
}
