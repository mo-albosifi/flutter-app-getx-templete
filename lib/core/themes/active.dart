import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:get/get.dart';

class ActiveTheme{

  //light.json, dark.json, {*}
  late final CoreTheme theme;


  Future<ActiveTheme> init() async{

    if(Get.isDarkMode){
      theme = Get.find<CoreTheme>(tag: ThemeTags.dark.name);
    }
    theme = Get.find<CoreTheme>(tag: ThemeTags.light.name);

    return this;
  }
}