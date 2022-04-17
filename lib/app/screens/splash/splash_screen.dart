import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/app/screens/splash/splash_controller.dart';
import 'package:flutter_app_getx_templete/ui/widgets/loadin_widget.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
            child: Obx(() => (controller.isLoading.value)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingWidget(title: controller.loadingTitle.value),
                      ElevatedButton(
                          onPressed: () => controller.stop(),
                          child: const Text("Stop"))
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.content.value),
                      ElevatedButton(
                          onPressed: () => controller.start(),
                          child: const Text("Start"))
                    ],
                  ))));
  }
}
