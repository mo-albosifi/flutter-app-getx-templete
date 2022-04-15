import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/base/controller/splash_controller.dart';
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
        child: Obx(
                () =>InitWidget()
        ),
      ),
    );
  }

  Widget InitWidget() {
    if (controller.isLoading.value) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(controller.loadingTitle.value),
          Text(controller.loadingMessage.value),
          const SizedBox(height: 20,),
          const CircularProgressIndicator(),
          ElevatedButton(onPressed: ()=>controller.stop(), child: Text("Stop"))

        ],
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

        ElevatedButton(onPressed: ()=>controller.test(), child: Text("Start"))

    ],);
    }
  }
}
