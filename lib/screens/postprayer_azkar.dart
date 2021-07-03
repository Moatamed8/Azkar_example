import 'package:flutter/material.dart';
import 'dart:convert';

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
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/PostPrayer_azkar.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            var mydata = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return buildWidget(
                    context,
                    mydata[index]["zekr"],
                    "عدد المرات:${mydata[index]["repeat"]}",
                    mydata[index]["bless"]);
              },
              itemCount: 13,
            );
          },
        ),
      ),
    );
  }

  Padding buildWidget(
      BuildContext context, String text1, String text2, String text3) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Aref+Ruqaa:700',
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text2,
                  style: TextStyle(
                    fontFamily: 'Aref+Ruqaa:700',
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text3,
                  style: TextStyle(
                    fontFamily: 'Aref+Ruqaa:700',
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),

            ],
          )),
    );
  }
}
