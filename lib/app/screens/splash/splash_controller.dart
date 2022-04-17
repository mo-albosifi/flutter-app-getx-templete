import 'dart:io';

import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_http_client.dart';
import 'package:flutter_app_getx_templete/core/enums/http_client_tags.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class SplashController extends CoreController {
  RxString content=RxString("");
  LoginRepository get loginRepo =>
      Get.find<CoreHttpClient>(tag: HttpClientTags.login.name)
          as LoginRepository;

  @override
  void onInit() async {
    super.onInit();
  }

  start() async {
    loading("loadingTitle".tr, "loadingMessage".tr);
    try {
      dio.Response a = await loginRepo.get("/posts");
      if (a.statusCode == 200) {
        content.value = a.data.toString().substring(0, 50);
      }
    }
    on SocketException catch (e) {
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      throw Exception("Bad response format");
    } on dio.DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
    endLoading();

  }

  stop() {
    endLoading();
  }
}
