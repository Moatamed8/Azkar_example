import 'package:flutter/material.dart';

class CustomFunctions {
  static pushScreen({required Widget widget, required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static pushScreenRepcalement(
      {required Widget widget, required BuildContext context}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => widget));
  }

  static cleanAndPush({required Widget widget, required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => widget), (route) => false);
  }
}
