import 'package:dio/dio.dart' as dio;
import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:flutter_app_getx_templete/core/store/app_store.dart';
import 'package:get/get.dart';

class CustomInterceptors extends dio.Interceptor {
  AppStore get appStore => Get.find<AppStore>();
  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    appStore.saveString(StoreKey.userId, options.path);
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    print('REQUEST[${options.headers}] => PATH: ${options.sendTimeout}');
    return super.onRequest(options, handler);
  }
  @override
  Future onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}