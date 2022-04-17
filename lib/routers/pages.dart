import 'package:flutter_app_getx_templete/app/middlewares/auth_middleware.dart';
import 'package:flutter_app_getx_templete/app/screens/splash/splash_binding.dart';
import 'package:flutter_app_getx_templete/app/screens/splash/splash_screen.dart';
import 'package:flutter_app_getx_templete/routers/routes.dart';
import 'package:get/get.dart';

class GetXPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
        middlewares: [
          // AuthMeddleWares(),
        ],
        transition: Transition.fadeIn)
  ];
}
