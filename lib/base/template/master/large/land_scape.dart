
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:get/get.dart';

class MasterTemplateLargeLandScape<T extends CoreController> extends GetView<T>{
  final GetView view;

  const MasterTemplateLargeLandScape({Key? key,required this.view}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    throw Row(
      children: [
        Container(width: Get.width/3,color: Colors.green,),
        Expanded(child: view)
      ],
    );
  }

}