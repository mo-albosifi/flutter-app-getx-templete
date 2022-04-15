import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/app/bindings/splash_binding.dart';
import 'package:flutter_app_getx_templete/app/pages/splash_page.dart';
import 'package:flutter_app_getx_templete/app/routers/routes.dart';
import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/locale/app_translations.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/dark_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  AppTranslations get appTranslations => Get.find();
  LightTheme get lightTheme => Get.find<CoreTheme>(tag: ThemeTags.light.name) as LightTheme;
  DarkTheme get darkTheme => Get.find<CoreTheme>(tag: ThemeTags.dark.name) as DarkTheme;
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: AppRoutes.splash,
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
      translations: appTranslations,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Here !
        DefaultWidgetsLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      theme: lightTheme.buildTheme(context),
      darkTheme: darkTheme.buildTheme(context),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'),Locale('en','US'),Locale('en','GB')],
      getPages: [
        SplashPage()
      ],
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({Key? key}) : super(key: key);
  LightTheme get lightTheme => Get.find<CoreTheme>(tag: ThemeTags.light.name) as LightTheme;
  DarkTheme get darkTheme => Get.find<CoreTheme>(tag: ThemeTags.dark.name) as DarkTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello Mohammed"),
      actions: [
        IconButton(onPressed: (){
          Get.changeTheme(lightTheme.buildTheme(context));
        },  icon: const Icon(Icons.light_mode,color: Colors.white,),),
        IconButton(onPressed: (){
          Get.changeTheme(darkTheme.buildTheme(context));
        },  icon: const Icon(Icons.dark_mode,color: Colors.white,),),
      ],),
      body: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){

              print("dark");

            }, child: const Text("Dark Theme")),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.changeTheme(lightTheme.buildTheme(context));
              print("light");
            }, child: const Text("Light Theme")),
            const SizedBox(height: 10,)
          ],
        ),),
    );
  }
}

