import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/store/app_store.dart';
import 'package:flutter_app_getx_templete/routers/routes.dart';
import 'package:get/get.dart';

class AuthMeddleWares extends GetMiddleware {
  final appStore = Get.find<AppStore>();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    // if (appStore.isAuthenticated) return RouteSettings(name: AppLinks.LOGIN);
    return RouteSettings(name: AppRoutes.login);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // TODO: implement onPageBuildStart
    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}