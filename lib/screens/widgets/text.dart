import 'package:azkar/helper/extenstions.dart';
import 'package:flutter/material.dart';

import '../../utils/FontsUtils.dart';
import '../../utils/colors.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  TextAlign textAlign;
  bool underline;
  bool aref;
  bool isEllipsis;

  CustomText(
      {super.key,
      required this.text,
      this.underline = false,
      this.aref = true,
      this.isEllipsis = false,
      this.fontSize = 12,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w500,
      this.color = AppColors.blackColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text == "" ? text : text.capitalizeFirst(),
      textAlign: textAlign,
      style: TextStyle(
          overflow: isEllipsis ? TextOverflow.ellipsis : TextOverflow.visible,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          decorationColor: Colors.blue,
          decorationThickness: 4,
          decorationStyle: TextDecorationStyle.dashed,
          fontFamily: aref ? FontUtils.aref : FontUtils.lemonada,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
