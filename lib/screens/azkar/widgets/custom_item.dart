import 'package:azkar/screens/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class CustomItem extends StatelessWidget {
  final String text;

  const CustomItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.whiteColorwithOpacity,
            border: Border.all(color: AppColors.greyColor, width: 3),
            borderRadius: BorderRadius.circular(8)),
        child: CustomText(
          text: text,
          fontSize: 25.sp,
          aref: true,
          fontWeight: FontWeight.w400,
        ));
  }
}
