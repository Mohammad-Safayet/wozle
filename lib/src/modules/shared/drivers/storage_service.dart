import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
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
    // TODO: implement get
    throw UnimplementedError();
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

  Future<void> reload() {
    // TODO: implement reload
    throw UnimplementedError();
  }

  Future<bool> remove(String key) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  Future<bool> setBool(String key, bool value) {
    // TODO: implement setBool
    throw UnimplementedError();
  }

  Future<bool> setDouble(String key, double value) {
    // TODO: implement setDouble
    throw UnimplementedError();
  }

  Future<bool> setInt(String key, int value) {
    // TODO: implement setInt
    throw UnimplementedError();
  }

  Future<bool> setString(String key, String value) {
    // TODO: implement setString
    throw UnimplementedError();
  }

  Future<bool> setStringList(String key, List<String> value) {
    // TODO: implement setStringList
    throw UnimplementedError();
  }
}
