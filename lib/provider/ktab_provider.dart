import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/hades_model.dart';

class AzkarProvider extends ChangeNotifier {
  List<Azkar> azkarMsa = [];
  List<Azkar> azkarSabah = [];
  List<Azkar> azkarPostPrayer = [];
  int counter = 0;

  static AzkarProvider of(BuildContext context, {bool listen = false}) {
    if (listen) return context.watch<AzkarProvider>();
    return context.read<AzkarProvider>();
  }

  getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt("counter") ?? 0);
    notifyListeners();
  }

  setCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", counter);
  }

  removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("counter");
  }
}
