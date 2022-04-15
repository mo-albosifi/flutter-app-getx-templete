import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CoreTheme {
  Map<String, dynamic> themeSettings = {};

  //light.json, dark.json, {*}
  String get fileName;

  ThemeData get themeData;

  set baseThemData(ThemeData themeData) => baseThemData = themeData;

  Future<CoreTheme> init() async {
    try {
      String data = await rootBundle.loadString('assets/themes/$fileName.json');
      themeSettings = Map<String, dynamic>.from(jsonDecode(data));
    } catch (e) {
      throw Exception("${e.toString()} Failed To Load Theme File");
    }
    return this;
  }


  ThemeData buildTheme(BuildContext ctx) {
    return themeData.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
    )));
  }

  Color color(String name, String shade) {
    String value = themeSettings['colors'][name][shade] ?? '#ff8d00';
    if (value.startsWith('#')) {
      value = value.replaceAll('#', '');
    }
    return Color(int.tryParse('0xff$value') ?? 0xffff8d00);
  }


  Color get primaryColor => color('primary', 'main');

  Color get primaryColorLight => color('primary', 'light');

  Color get primaryColorDark => color('primary', 'dark');

  Color get secondaryColor => color('secondary', 'main');

  Color get secondaryColorLight => color('secondary', 'light');

  Color get secondaryColorDark => color('secondary', 'dark');

  Color get infoColor => color('info', 'main');

  Color get infoColorLight => color('info', 'light');

  Color get infoColorDark => color('info', 'dark');

  Color get successColor => color('success', 'main');

  Color get successColorLight => color('success', 'light');

  Color get successColorDark => color('success', 'dark');

  Color get warningColor => color('warning', 'main');

  Color get warningColorLight => color('warning', 'light');

  Color get warningColorDark => color('warning', 'dark');

  Color get dangerColor => color('danger', 'main');

  Color get dangerColorLight => color('danger', 'light');

  Color get dangerColorDark => color('danger', 'dark');
}
