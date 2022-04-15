import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:get/get.dart';

class SplashController extends CoreController{

  @override
  void onInit() {
    super.onInit();

  }

  test(){
    loading("loadingTitle".tr,"loadingMessage".tr);
  }
  stop(){
    endLoading();
  }
}