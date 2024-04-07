import 'package:azkar/screens/sbha.dart';
import 'package:azkar/screens/widgets/text.dart';
import 'package:azkar/translations/locale_keys.g.dart';
import 'package:azkar/utils/kassets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/spacing.dart';
import '../utils/customFunctions.dart';
import 'azkar/masaa/azkar_masaa.dart';
import 'azkar/post_pray/postprayer_azkar.dart';
import 'azkar/sabah/azkar_sabah.dart';
import 'azkar/widgets/custom_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  KAssets.mekkah,
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: LocaleKeys.welcome.tr(),
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            verticalSpace(60),
            SizedBox(
              height: 400.h,
              child: GridView(
                padding: EdgeInsets.all(8.w),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      CustomFunctions.pushScreen(
                          widget: SbhaScreen(), context: context);
                    },
                    child: CustomItem(
                      text: LocaleKeys.sbha.tr(),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      CustomFunctions.pushScreen(
                          widget: AzkarSabah(), context: context);
                    },
                    child: CustomItem(
                      text: LocaleKeys.azkar_sbah.tr(),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      CustomFunctions.pushScreen(
                          widget: AzkarMasaa(), context: context);
                    },
                    child: CustomItem(
                      text: LocaleKeys.azkar_masaa.tr(),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      CustomFunctions.pushScreen(
                          widget: PostPrayer(), context: context);
                    },
                    child: CustomItem(
                      text: LocaleKeys.azkar_postprayer.tr(),
                    ),
                  ),
                  CustomItem(
                    text: LocaleKeys.quran.tr(),
                  ),
                  CustomItem(
                    text: LocaleKeys.ahadith.tr(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
