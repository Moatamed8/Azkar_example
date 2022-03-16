import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app2/provider/ktab_provider.dart';
import 'package:flutter_app2/widgets/custom_azkar_card.dart';

class PostPrayer extends StatefulWidget {
  static const routeName='/post_screen';

  @override
  _PostPrayerState createState() => _PostPrayerState();
}

class _PostPrayerState extends State<PostPrayer> {
  Color pr = Color(0xff131a31);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "أذكار الصباح",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25,
              fontFamily: 'Aref+Ruqaa:700',
            ),
            textAlign: TextAlign.end,
          ),
          backgroundColor: pr,
          brightness: Brightness.dark,

        ),
          body: ListView.builder(
            itemCount: AzkarProvider.of(context,listen: true).azkarPostPrayer.length,
            itemBuilder: (context, index) => CustomAzkarCard(
                function: (){
                  if(AzkarProvider.of(context).azkarPostPrayer[index].repeat==0){
                    AzkarProvider.of(context).azkarPostPrayer.remove(AzkarProvider.of(context).azkarPostPrayer[index]);
                  }else{
                    setState(() {
                      AzkarProvider.of(context).azkarPostPrayer[index].repeat--;

                    });
                  }
                },
                azkar: AzkarProvider.of(context,listen: true).azkarPostPrayer[index]),
          )));

  }


}
