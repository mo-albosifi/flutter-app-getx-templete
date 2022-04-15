import 'package:flutter_app_getx_templete/base/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }



}