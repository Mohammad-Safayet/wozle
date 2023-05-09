import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService extends GetxService {
  static SharedPrefsService get to => Get.find();

  late final SharedPreferences _preferences;

  Future<SharedPrefsService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> clear() async {
    return await _preferences.clear();
  }

  bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  Object? get(String key) {
    return _preferences.get(key);
  }

  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  Set<String> getKeys() {
    return _preferences.getKeys();
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }
}
