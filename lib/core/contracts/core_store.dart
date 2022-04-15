import 'package:flutter_app_getx_templete/core/enums/store_key.dart';

abstract class CoreStore{
  save<T>(StoreKey key,dynamic value);
  Future<T?> get<T>(StoreKey key);
  remove(StoreKey key);
  clear();
}