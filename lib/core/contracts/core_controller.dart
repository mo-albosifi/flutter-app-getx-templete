import 'package:flutter_app_getx_templete/core/mixins/active_theme_mixin.dart';
import 'package:flutter_app_getx_templete/core/mixins/validations_mixin.dart';
import 'package:get/get.dart';

abstract class CoreController extends GetxController
    with ValidatorMixin, ActiveThemeMixin {
  RxBool isLoading = RxBool(false);
  RxString loadingTitle = RxString('');
  RxString loadingMessage = RxString('');

  RxBool hasError = RxBool(false);
  RxString errorTitle = RxString('');
  RxString errorMessage = RxString('');

  RxBool hasSuccess = RxBool(false);
  RxString successTitle = RxString('');
  RxString successMessage = RxString('');

  loading([String title = "", String message = ""]) {
    isLoading.value = true;
    loadingTitle.value = title;
    loadingMessage.value = message;
  }

  error([String title = "", String message = ""]) {
    hasError.value = true;
    errorTitle.value = title;
    errorMessage.value = message;
  }

  success([String title = "", String message = ""]) {
    hasSuccess.value = true;
    successTitle.value = title;
    successMessage.value = message;
  }

  endLoading() {
    isLoading.value = false;
    loadingTitle.value = '';
    loadingMessage.value = '';
  }

  endError() {
    hasError.value = false;
    errorTitle.value = '';
    errorMessage.value = '';
  }

  endEndSuccess() {
    hasSuccess.value = false;
    successTitle.value = '';
    successMessage.value = '';
  }

}
