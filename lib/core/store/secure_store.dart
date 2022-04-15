import 'package:flutter_app_getx_templete/core/contracts/core_store.dart';
import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore implements CoreStore{

  late FlutterSecureStorage _secureStorage;

  Future<SecureStore> init() async{
    _secureStorage= const FlutterSecureStorage();
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