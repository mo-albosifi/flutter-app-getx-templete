import 'package:flutter_app_getx_templete/core/contracts/core_menu.dart';

class AppRouter{
  static final AppRouter _singleton=AppRouter._internal();
  List<CoreMenu> get menus=>[];

  AppRouter._internal();

  factory AppRouter()=>_singleton;
}