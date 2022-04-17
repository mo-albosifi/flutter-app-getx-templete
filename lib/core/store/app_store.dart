import 'package:flutter_app_getx_templete/core/enums/store_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contracts/core_store.dart';

class AppStore {
  late SharedPreferences _sharedPreferences;

  Future<AppStore> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  SharedPreferences getSharedPreferences() => _sharedPreferences;
  Future<bool> clear() async => await _sharedPreferences.clear();

  Future<String?> getString(StoreKey key) async =>
      _sharedPreferences.getString(key.name);

  Future<int?> getInt(StoreKey key) async =>
      _sharedPreferences.getInt(key.name);

  Future<bool?> getBoolean(StoreKey key) async =>
      _sharedPreferences.getBool(key.name);

  Future<double?> getDouble(StoreKey key) async =>
      _sharedPreferences.getDouble(key.name);

  Future<bool> saveString(StoreKey key, String value) async =>
      await _sharedPreferences.setString(key.name, value);

  Future<bool> saveBoolean(StoreKey key, bool value) async =>
      await _sharedPreferences.setBool(key.name, value);

  Future<bool> saveInt(StoreKey key, int value) async =>
      await _sharedPreferences.setInt(key.name, value);

  Future<bool> saveDouble(StoreKey key, double value) async =>
      await _sharedPreferences.setDouble(key.name, value);

  Future<bool?> remove(StoreKey key) async =>
      await _sharedPreferences.remove(key.name);
}
