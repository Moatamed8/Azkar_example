import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app2/provider/ktab_provider.dart';
import 'package:flutter_app2/widgets/custom_azkar_card.dart';

class AzkarSabah extends StatefulWidget {
  static const routeName='/sabah_screen';

  @override
  _AzkarSabahState createState() => _AzkarSabahState();
}

class _AzkarSabahState extends State<AzkarSabah> {
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
                color: Colors.yellow, fontSize: 25, fontFamily: 'Aref+Ruqaa:700'),
            textAlign: TextAlign.end,
          ),
          backgroundColor: pr,
          brightness: Brightness.dark,
        ),
          body: ListView.builder(
            itemCount: AzkarProvider.of(context,listen: true).azkarSabah.length,
            itemBuilder: (context, index) => CustomAzkarCard(
                function: (){
                  if(AzkarProvider.of(context).azkarSabah[index].repeat==0){
                    AzkarProvider.of(context).azkarSabah.remove(AzkarProvider.of(context).azkarSabah[index]);
                  }else{
                    setState(() {
                      AzkarProvider.of(context).azkarSabah[index].repeat--;

                    });
                  }
                },
                azkar: AzkarProvider.of(context,listen: true).azkarSabah[index]),
          )));

  }

}
