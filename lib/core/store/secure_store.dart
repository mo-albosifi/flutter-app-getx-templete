import 'package:flutter_app_getx_templete/core/contracts/core_store.dart';
import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {

  late FlutterSecureStorage _secureStorage;

  Future<SecureStore> init() async{
    _secureStorage= const FlutterSecureStorage();
    return this;
  }

  FlutterSecureStorage getSecureStorage() => _secureStorage;
  Future<void> clear() async=>await _secureStorage.deleteAll();
  Future<String?> get(StoreKey key) async => await _secureStorage.read(key: key.name);
  Future<void> remove(StoreKey key) async => await _secureStorage.delete(key: key.name);
  Future<void> save(StoreKey key,value) async => await _secureStorage.write(key: key.name,value: value);

}