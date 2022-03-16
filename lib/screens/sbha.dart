import 'package:flutter/material.dart';
import 'package:flutter_app2/provider/ktab_provider.dart';

class SbhaScreen extends StatefulWidget {
  @override
  _SbhaScreenState createState() => _SbhaScreenState();
}

class _SbhaScreenState extends State<SbhaScreen> {
  Color pr = Color(0xff131a31);
  bool isClick = true;

  _dismissDialog() {
    Navigator.pop(context);
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.lightBlue[50],
            title: Text(
              'تنبيه',
              textAlign: TextAlign.right,
            ),
            content: Text(
              'هل تريد الرجوع إلي الصفر؟',
              textAlign: TextAlign.right,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('إلغاء')),
              FlatButton(
                onPressed: () {
                  _dismissDialog();
                  AzkarProvider.of(context).removeCounter();
                  setState(() {
                    AzkarProvider.of(context).counter = 0;
                  });
                },
                child: Text('نعم'),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    AzkarProvider.of(context).getCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: pr,
          iconTheme: IconThemeData(color: Colors.yellow),
          title: Text(
            "السبحه",
            style: TextStyle(
                color: Colors.yellow, fontSize: 25, fontFamily: 'Aref+Ruqaa:700'),
          ),
        ),
        body:  Stack(
            children: [
              Container(
                height: double.infinity,
                child: Image.asset(
                  'assets/images/bg.gif',
                  fit: BoxFit.fill,
                ),
              ),
              ListView(
                children: <Widget>[
                  Center(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 250,
                        width: 250,
                        child: Center(
                            child: Text(
                          '${AzkarProvider.of(context, listen: true).counter}',
                          style: TextStyle(
                              fontSize: 70.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              AzkarProvider.of(context, listen: true).counter++;
                            });
                            AzkarProvider.of(context).setCounter();
                          },
                          child: Container(
                            height: 60.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              'أضغط هنا للتسبيح',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Aref+Ruqaa:700'),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showMaterialDialog();
                        },
                        child: Container(
                          height: 60.0,
                          width: 140.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'الرجوع للصفر؟',
                              style: TextStyle(
                                fontFamily: 'Aref+Ruqaa:700',
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
/*
        endDrawer: MyDrawer(),
*/
      ),
    );
  }
}
