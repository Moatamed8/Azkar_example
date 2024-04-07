// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "azkar": "Azkar",
    "welcome": "Welcome to Azkar",
    "azkar_sbah": "Morning Azkar",
    "azkar_masaa": "Night Azkar",
    "azkar_postprayer": "Post Prayer Azkar",
    "quran": "Quran",
    "sbha": "Sbha",
    "ahadith": "Ahadith"
  };
  static const Map<String, dynamic> ar = {
    "azkar": "اذكار",
    "welcome": "مرحبا بكم في أذكاري",
    "sabah": "الصباح",
    "masaa": "المساء",
    "azkar_sbah": "اذكار الصباح",
    "azkar_masaa": "اذكار المساء",
    "azkar_postprayer": "اذكار بعد الصلاة",
    "quran": "القرآن",
    "sbha": "السبحة",
    "ahadith": "الاحاديث"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "ar": ar
  };
}
