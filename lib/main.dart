import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/azkar_masaa.dart';
import 'package:flutter_app2/screens/azkar_sabah.dart';
import 'package:flutter_app2/screens/postprayer_azkar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color pr=Color(0xff131a31);

  int _counter = 0;
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
                  removeCounter();
                  setState(() {
                    _counter = 0;
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
    getCounter();
  }

  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt("counter") ?? 0);
    });
  }

  setCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", _counter);
  }

  removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("counter");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: pr,
        iconTheme: IconThemeData(color: Colors.yellow),
        centerTitle: true,
        title: Text(
        "السبحه",
          style: TextStyle(
              color: Colors.yellow, fontSize: 25, fontFamily: 'Aref+Ruqaa:700'),
          textDirection: TextDirection.rtl,
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset('assets/images/bg.gif',fit: BoxFit.fitHeight,),
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
                          '$_counter',
                          style: TextStyle(fontSize: 70.0,color: Colors.white,fontWeight: FontWeight.bold),
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
                          _counter++;
                        });
                        setCounter();
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
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(

              height: 200,

              child: Image.asset('assets/images/logo.png')
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AzkarSabah()));
              },
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.amber,
              ),
              title: Text(
                "أذكار الصباح",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.amber,
                  fontSize: 40,
                  fontFamily: 'Aref+Ruqaa:700',),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AzkarMasaa()));
              },
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.amber,
              ),
              title: Text(
                "أذكار المساء",
                
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40,
                    fontFamily: 'Aref+Ruqaa:700',

                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostPrayer()));
              },
              leading: Icon(
                Icons.arrow_back_ios,
                color: Colors.amber,
              ),
              title: Text(
                "أذكار بعد الصلاة",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40,
                    fontFamily: 'Aref+Ruqaa:700'
                    ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
