import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/FontsUtils.dart';
import '../utils/colors.dart';

class CustomItem extends StatelessWidget {
  final String text;

  CustomItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorsUtils.whiteColorwithOpacity,
          border: Border.all(color: ColorsUtils.greyColor, width: 3),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: TextStyle(
            color: ColorsUtils.black,
            fontFamily: FontUtils.aref,
            fontWeight: FontWeight.w400,
            fontSize: 25),
      ),
    );
  }
}
