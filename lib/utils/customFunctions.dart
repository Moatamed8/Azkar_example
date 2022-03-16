import 'package:flutter/material.dart';

class CustomFunctions {
  static pushScreen({Widget widget, BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => widget));
  }

  static popScreen(BuildContext context) {
    Navigator.pop(context);
  }

  static pushScreenRepcalement({Widget widget, BuildContext context}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => widget));
  }

  static cleanAndPush({Widget widget, BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (c) => widget), (route) => false);
  }

}
