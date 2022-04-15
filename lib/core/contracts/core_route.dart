
import 'package:flutter/material.dart';
import 'package:flutter_app_getx_templete/core/contracts/core_policy.dart';

abstract class CoreRoute {
  String name;
  String path;
  VoidCallback onclick;
  Widget? child;

  CorePolicy?  policy;
  List<CorePolicy>?  allPolicies;
  List<CorePolicy>?  anyPolicies;

  CoreRoute({required this.name, required this.path, required this.onclick, this.child,this.policy,this.allPolicies,this.anyPolicies});

  enabled(){
    if(policy!=null ) {
      return policy!.enabled();
    }
    if(anyPolicies!=null && anyPolicies!.isNotEmpty ) {
      for (var p in anyPolicies!){
        if(p.enabled()){
          return true;
        }
      }
      return false;
    }

    if(allPolicies!=null && allPolicies!.isNotEmpty ) {
      for (var p in allPolicies!){
        if(!p.enabled()){
          return false;
        }
      }
      return true;
    }
    return true;

  }


  display(){
    if(policy!=null ) {
      return policy!.display();
    }
    if(anyPolicies!=null && anyPolicies!.isNotEmpty ) {
      for (var p in anyPolicies!){
        if(p.display()){
          return true;
        }
      }
      return false;
    }

    if(allPolicies!=null && allPolicies!.isNotEmpty ) {
      for (var p in allPolicies!){
        if(!p.display()){
          return false;
        }
      }
      return true;
    }
    return true;
  }


  see()=>true;
}
