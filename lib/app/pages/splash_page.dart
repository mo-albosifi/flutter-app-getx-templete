import 'package:flutter_app_getx_templete/app/bindings/splash_binding.dart';
import 'package:flutter_app_getx_templete/app/routers/routes.dart';
import 'package:flutter_app_getx_templete/app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class SplashPage extends GetPage{
  SplashPage() : super(name: AppRoutes.splash, page:()=> const SplashScreen(),binding: SplashBinding());

}