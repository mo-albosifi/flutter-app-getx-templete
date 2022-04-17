import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:flutter_app_getx_templete/ui/template/master/large/land_scape.dart';
import 'package:flutter_app_getx_templete/ui/template/master/medium/land_scape.dart';
import 'package:flutter_app_getx_templete/ui/template/master/medium/portrait.dart';
import 'package:flutter_app_getx_templete/ui/template/master/small/land_scape.dart';
import 'package:flutter_app_getx_templete/ui/template/master/small/portrait.dart';
import 'package:get/get.dart';

class MasterTemplete<T extends CoreController> extends GetResponsiveView<T> {
  final GetView view;
  MasterTemplete({Key? key,required this.view}) : super(key: key);

  @override
  Widget desktop() {
    return MasterTemplateLargeLandScape<T>(view: view,);
  }

  @override
  Widget tablet() {
    return OrientationBuilder(builder: (BuildContext context,Orientation orientation){
        if(orientation== Orientation.landscape){
          return MasterTemplateMediumLandScape<T>(view: view);
        }else{
          return MasterTemplateMediumPortrait<T>(view: view);
        }
    });
  }

  @override
  Widget phone() {
    return OrientationBuilder(builder: (BuildContext context,Orientation orientation){
      if(orientation== Orientation.landscape){
        return MasterTemplateSmallLandScape<T>(view: view);
      }else{
        return MasterTemplateSmallPortrait<T>(view: view);
      }
    });
  }
}