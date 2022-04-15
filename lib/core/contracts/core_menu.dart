import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_policy.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_route.dart';

abstract class CoreMenu{
  String get name;
  CorePolicy? get policy;
  List<CorePolicy>? get allPolicies;
  List<CorePolicy>? get anyPolicies;

  List<CoreRoute> get routes;

  List<CoreMenu>? get subMenus;
  Widget? get child;
}