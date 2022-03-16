import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app2/model/hades_model.dart';
import 'package:flutter_app2/utils/FontsUtils.dart';

class CustomAzkarCard extends StatelessWidget {
  final Azkar azkar;
  final Function function;

  CustomAzkarCard({this.azkar, this.function});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: function,
        child: Container(
          margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black, width: 5.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  azkar.zkr,
                  style: TextStyle(
                    fontFamily: FontUtils.aref,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "عدد المرات:${azkar.repeat}",
                  style: TextStyle(
                    fontFamily: FontUtils.aref,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  azkar.bless,
                  style: TextStyle(
                    fontFamily: FontUtils.aref,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
