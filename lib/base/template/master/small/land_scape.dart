import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:get/get.dart';

class MasterTemplateSmallLandScape<T extends CoreController> extends GetView<T>{
  final GetView view;

  const MasterTemplateSmallLandScape({Key? key,required this.view}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return view;
  }

}