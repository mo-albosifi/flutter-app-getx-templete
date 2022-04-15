import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contracts/core_store.dart';

class AppStore implements CoreStore{

  late SharedPreferences _sharedPreferences;
  Future<AppStore> init() async{
    _sharedPreferences =await SharedPreferences.getInstance();
    return this;
  }

  @override
  clear() async{
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<T?> get<T>(StoreKey key) async{
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  remove(StoreKey key) async{
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  save<T>(StoreKey key, value) async{
    // TODO: implement save
    throw UnimplementedError();
  }
}