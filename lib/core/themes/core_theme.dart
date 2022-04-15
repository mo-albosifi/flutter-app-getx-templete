// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CoreTheme{

  Map<String,dynamic>  themeSettings={};

  //light.json, dark.json, {*}
  String get fileName;

  ThemeData get themeData;
  set baseThemData(ThemeData themeData)=>baseThemData=themeData;

  Future<CoreTheme> init() async{
    try{
      String data=await rootBundle.loadString('assets/themes/$fileName.json');
      themeSettings =Map<String,dynamic>.from(jsonDecode(data));
      print(themeSettings);
    }catch(e){
      throw Exception("${e.toString()} Failed To Load Theme File");
    }
    return this;
  }
}