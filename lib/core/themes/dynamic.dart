import 'package:flutter/material.dart';
import 'core_theme.dart';

class DynamicTheme extends CoreTheme{
  late final String name;
  late final ThemeData theme;

  DynamicTheme({required this.name,required this.theme});
  @override
  String get fileName => name;

  @override
  ThemeData get themeData => theme;


}