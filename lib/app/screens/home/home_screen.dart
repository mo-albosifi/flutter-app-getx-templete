
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/base/template/master/master.dart';
import 'package:flutter_app_getx_templete/core/enums/theme_tags.dart';
import 'package:flutter_app_getx_templete/core/themes/core_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/dark_theme.dart';
import 'package:flutter_app_getx_templete/core/themes/light_theme.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MasterTemplete(view: const HomeScreenContent());
    return  const HomeScreenContent();
  }
}

class HomeScreenContent extends GetView {
  const HomeScreenContent({Key? key}) : super(key: key);
  LightTheme get lightTheme => Get.find<CoreTheme>(tag: ThemeTags.light.name) as LightTheme;
  DarkTheme get darkTheme => Get.find<CoreTheme>(tag: ThemeTags.dark.name) as DarkTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.changeTheme(lightTheme.buildTheme(context));
          },  icon: const Icon(Icons.light_mode,color: Colors.white,),),
          IconButton(onPressed: (){
            Get.changeTheme(darkTheme.buildTheme(context));
          },  icon: const Icon(Icons.dark_mode,color: Colors.white,),),
          PopupMenuButton<String>(
            onSelected: (String value){

            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  onTap: (){
                    Get.changeTheme(darkTheme.buildTheme(context));
                  },
                  value: "Hi 1",
                  child: Text("Dark 1"),
                ),
                PopupMenuItem<String>(
                  onTap: (){
                    Get.changeTheme(lightTheme.buildTheme(context));
                  },
                  value: "Hi 1",
                  child: Text("Light 1"),
                ),
              ];
            },
          ),
        ],),
      body: Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [

        ],
      ),),
    );
  }
}
