import 'dart:convert';

import 'package:azkar/provider/ktab_provider.dart';
import 'package:azkar/screens/home.dart';
import 'package:azkar/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'model/hades_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ar'),
    startLocale: Locale("ar" /*Platform.localeName.substring(0, 2)*/),
    assetLoader: const CodegenLoader(),
    child: MultiProvider(providers: [
      ChangeNotifierProvider.value(value: AzkarProvider()),
    ], child: MyApp()),
  ));
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
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: MaterialApp(
              theme: ThemeData(useMaterial3: false),
              debugShowCheckedModeBanner: false,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              title: 'AZKAR',
              home: child,
            ),
          );
        },
        child: HomeScreen());
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
