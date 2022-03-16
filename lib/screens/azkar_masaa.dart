import 'package:flutter/material.dart';


import 'package:flutter_app2/provider/ktab_provider.dart';
import 'package:flutter_app2/utils/FontsUtils.dart';
import 'package:flutter_app2/widgets/custom_azkar_card.dart';

class AzkarMasaa extends StatefulWidget {
  static const routeName = '/masaa_screen';

  @override
  _AzkarMasaaState createState() => _AzkarMasaaState();
}

class _AzkarMasaaState extends State<AzkarMasaa>
    with SingleTickerProviderStateMixin {
  Color pr = Color(0xff131a31);
  List data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              title: Text(
                "أذكار المساء",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontFamily: FontUtils.aref,
                ),
              ),
              backgroundColor: pr,
            ),
            body: ListView.builder(
              itemCount: AzkarProvider.of(context,listen: true).azkarMsa.length,
              itemBuilder: (context, index) => CustomAzkarCard(
                function: (){
                  if(AzkarProvider.of(context).azkarMsa[index].repeat==0){
                    setState(() {
                      AzkarProvider.of(context).azkarMsa.remove(AzkarProvider.of(context).azkarMsa[index]);

                    });
                  }else{
                      setState(() {
                        AzkarProvider.of(context).azkarMsa[index].repeat--;

                    });
                  }
                },
                  azkar: AzkarProvider.of(context,listen: true).azkarMsa[index]),
            )));
  }

}
