import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/themes/active.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:get/get.dart';

mixin ActiveThemeMixin{
  ActiveTheme get activeThem => Get.find<ActiveTheme>(tag: ThemeTags.active.name);
}