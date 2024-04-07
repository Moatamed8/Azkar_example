import 'dart:convert';

import 'package:azkar/provider/ktab_provider.dart';
import 'package:azkar/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:provider/provider.dart';

import 'model/hades_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AzkarProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getAzkarMasaa();
    getAzkarSabah();
    getAzkarPostPrayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

  Future<void> getAzkarMasaa() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/azkar_massa.json');
    final model = jsonDecode(jsonData);
    final azkarMsaList =
        List<Azkar>.from(model['AzkarMassa'].map((e) => Azkar.fromMap(e)));
    AzkarProvider.of(context).azkarMsa = azkarMsaList;
    print("${azkarMsaList.length}");
  }

  Future<void> getAzkarSabah() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/azkar_sabah.json');
    final model = jsonDecode(jsonData);
    final azkarMsaList =
        List<Azkar>.from(model['AzkarSabah'].map((e) => Azkar.fromMap(e)));
    AzkarProvider.of(context).azkarSabah = azkarMsaList;
    print("${azkarMsaList.length}");
  }

  Future<void> getAzkarPostPrayer() async {
    final jsonData = await rootBundle.rootBundle
        .loadString('assets/json/PostPrayer_azkar.json');
    final model = jsonDecode(jsonData);
    final azkarMsaList =
        List<Azkar>.from(model['AzkarPostPrayer'].map((e) => Azkar.fromMap(e)));
    AzkarProvider.of(context).azkarPostPrayer = azkarMsaList;
    print("${azkarMsaList.length}");
  }
}
