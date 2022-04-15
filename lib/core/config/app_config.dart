import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/locale/app_translations.dart';
import 'package:flutter_app_getx_templete/core/store/secure_store.dart';
import 'package:flutter_app_getx_templete/core/themes/active.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/dark_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/light_theme.dart';
import 'package:get/get.dart';

import '../store/app_store.dart';

class AppConfig {
  static init() async {
    // Inject Stores Dependencies
    Get.putAsync<AppStore>(() => AppStore().init(), permanent: true);
    Get.putAsync<SecureStore>(() => SecureStore().init(), permanent: true);

    // Inject Translations Dependencies
    // Get.putAsync<AppTranslations>(() => AppTranslations().init(),permanent: true);


    // Inject Themes Dependencies
    Get.putAsync<CoreTheme>(() => LightTheme().init(),tag: ThemeTags.light.name);
    Get.putAsync<CoreTheme>(() => DarkTheme().init(), tag: ThemeTags.dark.name);
    Get.putAsync<ActiveTheme>(() => ActiveTheme().init(),permanent: true, tag: ThemeTags.active.name);
  }
}
