import 'package:dio/dio.dart';
import 'package:flutter_app_getx_templete/core/constants/app_urls.dart';
import 'package:flutter_app_getx_templete/core/data/remote/Interceptors.dart';
import 'package:flutter_app_getx_templete/core/data/remote/LoggingInterceptors.dart';
import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:flutter_app_getx_templete/core/store/app_store.dart';
import 'package:flutter_app_getx_templete/core/store/secure_store.dart';
import 'package:get/get.dart' as getx;


abstract class CoreHttpClient {
  bool get isAuthorization;
  bool get tokenIsSecure=>false;
  late Dio dio;

  CoreHttpClient() {
    dio = Dio(BaseOptions(
        baseUrl: AppUrls.baseUrl,
        connectTimeout: 50000,
        receiveTimeout: 3000,
        headers: {"Content-Type": "application/json"}))
      ..interceptors.add(LoggingInterceptor())
      ..interceptors.add(CustomInterceptors());
  }

  addHeader(Map<String, dynamic> headers) => dio.options.headers.addAll(headers);


  Future validBearer() async{
    if (isAuthorization) {
      String? token="";
      if(tokenIsSecure){
        SecureStore  secureStore = getx.Get.find<SecureStore>();
        token = await secureStore.get(StoreKey.token);
      }else{
        AppStore  appStore = getx.Get.find<AppStore>();
        token = await appStore.getString(StoreKey.token);
      }

      if (token != null && token.isNotEmpty) {
        dio.options.headers.addAll({"Authorization": "bearer $token"});
      } else {
        throw Exception("Can not Read Token From Store");
      }
    }
  }

  Future<Response> get([String prefix = ""]) async {
    await validBearer();
    return await dio.get(prefix);
  }

  Future<Response> post({String prefix = "", dynamic body}) async {
    await validBearer();
    return dio.post(prefix, data: body);
  }

  Future<Response> put({String prefix = "", dynamic body}) async {
    validBearer();
    return dio.put(prefix, data: body);
  }

  Future<Response> download({String prefix = "", String savePath = "./",ProgressCallback? onReceiveProgress}) async {
    return await dio.download(prefix, savePath,onReceiveProgress: onReceiveProgress);
  }

  // Future<Response> upload(String path,
  //     {data,
  //     ProgressCallback? onSendProgress,
  //     ProgressCallback? onReceiveProgress}) async {
  // }

  Future<Response> delete({String prefix = ""}) async {
    validBearer();
    return dio.delete(prefix);
  }
}

class LoginRepository extends CoreHttpClient {
  @override
  bool get isAuthorization => false;
  @override
  bool get tokenIsSecure => false;


  LoginRepository();
}
