import 'package:flutter_app_getx_templete/core/contracts/core_http_client.dart';
import 'package:flutter_app_getx_templete/core/enums/http_client_tags.dart';
import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/locale/app_translations.dart';
import 'package:flutter_app_getx_templete/core/store/secure_store.dart';
import 'package:flutter_app_getx_templete/core/themes/active.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/dark_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/light_theme.dart';
import 'package:get/get.dart';

import 'store/app_store.dart';

class AppInitialization {
  static init() async {
    // Inject Stores Dependencies
    await Get.putAsync<AppStore>(() => AppStore().init(), permanent: true);
    await Get.putAsync<SecureStore>(() => SecureStore().init(), permanent: true);

    // Inject Translations Dependencies
    await  Get.putAsync<AppTranslations>(() => AppTranslations().init(),permanent: true);


    // Inject Http Clients Dependencies
    Get.put<CoreHttpClient>(LoginRepository(),permanent: true, tag: HttpClientTags.login.name);


    // Inject Themes Dependencies
    await Get.putAsync<CoreTheme>(() => LightTheme().init(),tag: ThemeTags.light.name);
    await Get.putAsync<CoreTheme>(() => DarkTheme().init(), tag: ThemeTags.dark.name);
    await Get.putAsync<ActiveTheme>(() => ActiveTheme().init(),permanent: true, tag: ThemeTags.active.name);
  }
}
