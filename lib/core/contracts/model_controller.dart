import 'package:flutter_app_getx_templete/core/contracts/core_controller.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_model.dart';
import 'package:flutter_app_getx_templete/core/mixins/active_theme_mixin.dart';
import 'package:flutter_app_getx_templete/core/mixins/validations_mixin.dart';
import 'package:get/get.dart';

abstract class ModelController<T extends CoreModel> extends CoreController{
  RxList<T> modelList=RxList<T>();
  Rxn<T> selectedModel=Rxn<T>();

  getModels();
  getModel(String id);
}
