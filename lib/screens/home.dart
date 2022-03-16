import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/azkar_masaa.dart';
import 'package:flutter_app2/screens/postprayer_azkar.dart';
import 'package:flutter_app2/screens/sbha.dart';
import 'package:flutter_app2/utils/FontsUtils.dart';
import 'package:flutter_app2/utils/customFunctions.dart';
import 'package:flutter_app2/widgets/custom_item.dart';

import 'azkar_sabah.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/mekkah.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "مرحبا بكم في أذكاري",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontUtils.aref),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 400,
              child: GridView(
                padding: EdgeInsets.all(8),
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      CustomFunctions.pushScreen(widget: SbhaScreen(),context: context);
                    },
                    child: CustomItem(
                      text: "السبــحة",
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      CustomFunctions.pushScreen(widget: AzkarSabah(),context: context);
                    },
                    child: CustomItem(
                      text: "أذكار الصباح",
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      CustomFunctions.pushScreen(widget: AzkarMasaa(),context: context);
                    },                    child: CustomItem(
                      text: "أذكار المساء",
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      CustomFunctions.pushScreen(widget: PostPrayer(),context: context);
                    },
                    child: CustomItem(
                      text: "أذكار بعد الصلاة",
                    ),
                  ),
                  CustomItem(
                    text: "قرإن",
                  ),
                  CustomItem(
                    text: "احاديث",
                  ),
                ],
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
