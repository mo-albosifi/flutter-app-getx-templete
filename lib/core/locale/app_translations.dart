import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final List<String> availableLocales = ['ar', 'en'];
  final List<String> fileList = ['generals', 'validations', 'actions'];

  @override
  Map<String, Map<String, String>> get keys => loadedKeys;
  Map<String, Map<String, String>> loadedKeys = {};

  Future<AppTranslations> init() async {
    for (var locale in availableLocales) {
      loadedKeys[locale] = {};
      try {
        for (var file in fileList) {
          loadedKeys[locale]!.addAll(Map<String, String>.from(jsonDecode(
              (await rootBundle
                  .loadString('assets/locale/$locale/$file.json')))));
        }
      } catch (e) {
        throw Exception("${e.toString()} Failed To Load Theme File");
      }
    }
    return this;
  }
}
